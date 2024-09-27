const functions = require('firebase-functions/v2'); // Use v2 for 2nd Gen
const axios = require('axios');
const admin = require('firebase-admin');

admin.initializeApp();

exports.paystack2 = functions.https.onCall(
  async (datam, context) => {
    try {
      // Check if the user is authenticated
      if (!context.auth) {
        throw new functions.https.HttpsError('unauthenticated', 'Not authenticated');
      }

      // Validate input data
      const { tid, amount } = datam;
      if (!tid || typeof amount !== 'number' || amount <= 0) {
        throw new functions.https.HttpsError('invalid-argument', 'Missing or invalid transaction ID or amount');
      }

      const email = context.auth.token.email; // Get the user's email
      const totalAmount = Math.ceil(amount); // Round up the amount
      console.log("Processing amount: " + totalAmount);

      const checkoutDoc = await admin.firestore().collection('checkout').doc(tid).get();
      if (!checkoutDoc.exists) {
        throw new functions.https.HttpsError('not-found', 'Transaction not found');
      }

      const { ghshipping, ghtotal } = checkoutDoc.data();
      console.log(`Shipping: ${ghshipping}, Total: ${ghtotal}`);

      const totalPayment = ghshipping + ghtotal;

      const postdata = {
        amount: totalPayment,
        email: email,
        reference: tid,
        currency: "GHS",
        paymentChannel: ["mobile_money"]
      };

      const authToken = functions.config().paystack.secret; // Use environment variable
      const config = {
        headers: {
          'Authorization': `Bearer ${authToken}`,
          'Content-Type': 'application/json'
        }
      };

      let sendapi;
      try {
        sendapi = await axios.post('https://api.paystack.co/transaction/initialize', postdata, config);
      } catch (apiError) {
        console.error('Paystack API error:', apiError);
        throw new functions.https.HttpsError('internal', 'Paystack API error');
      }

      console.log('Paystack response:', sendapi.data);

      return {
        success: true,
        status: sendapi.data.status,
        message: sendapi.data.message,
        data: {
          shipping: ghshipping,
          total: ghtotal,
          paymentUrl: sendapi.data.data.authorization_url
        }
      };
    } catch (e) {
      console.error('Error details:', e);
      throw new functions.https.HttpsError('internal', e.message || 'Something went wrong');
    }
  }
);

exports.currency2 = functions.https.onCall(
  async (datam, context) => {
    try {
      const sendapi = await axios.get('https://open.er-api.com/v6/latest/USD');
      console.log(sendapi.data);
      return sendapi.data.rates.GHS;
    } catch (e) {
      console.error(e);
      throw new functions.https.HttpsError('internal', 'Failed to fetch currency rates');
    }
  }
);

exports.paystackcall2 = functions.https.onRequest(
  async (req, res) => {
    const responsedata = req.body;
    const { event, data } = responsedata;
    const reference = data.reference;

    // Update Firestore documents
    try {
      await admin.firestore().collection("userstest").doc(reference).set({ code: responsedata });
      await admin.firestore().collection("checkout").doc(reference).update({ status: true });
      res.status(200).send('Success: ' + reference);
    } catch (error) {
      console.error('Error updating Firestore:', error);
      res.status(500).send('Error updating data');
    }
  }
);

exports.chat2 = functions.https.onCall(
  async (data, context) => {
    // You can uncomment this if you want to enforce authentication
    // if (!context.auth) {
    //   throw new functions.https.HttpsError('unauthenticated', 'Request had no authentication.');
    // }

    const requestData = JSON.stringify({
      "contents": [
        {
          "parts": [
            { "text": data.text }
          ]
        }
      ]
    });

    const config = {
      method: 'post',
      url: 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=YOUR_API_KEY',
      headers: {
        'Content-Type': 'application/json'
      },
      data: requestData
    };

    try {
      const response = await axios.request(config);
      return response.data;
    } catch (error) {
      console.error('Chat API error:', error);
      throw new functions.https.HttpsError('internal', 'Unable to generate content');
    }
  }
);
