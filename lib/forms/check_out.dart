import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:africanstraw/components/global.dart';
import 'package:africanstraw/tables/checkout_table.dart';
import 'package:provider/provider.dart';

import '../components/login_field.dart';
import '../controller/controller.dart';
import '../widgets/route.dart';

class CheckoutForm extends StatefulWidget {
  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController postcode = TextEditingController();
  TextEditingController street = TextEditingController();

  final GlobalKey<FormState> formskey = GlobalKey<FormState>();
  String? selectedValue; // Holds the selected value from the dropdown
  String? _selectedCountry; // Default country
  String? _selectedRegion; // Default region for Ghana
  String? _selectedCity; // Default region for Ghana

  final Map<String, List<String>> _regionsByCountry = {
    'Ghana': ['Accra', 'Kumasi', 'Tamale', 'Cape Coast'],
    'Nigeria': ['Abuja', 'Lagos', 'Kano', 'Ibadan'],
    // Add more countries and their regions here
  };

  String? selectedDestination;  // Holds the selected destination
  String? amount="0";  // Holds the fetched amount based on the selected destination
  int? selectedIndex;  // Holds the index of the selected item

  // Fetch the amount when a destination is selected
  Future<void> fetchAmount(String destination) async {
    try {
      // Query Firestore for the document with the selected destination
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('delivery')
          .where('destination', isEqualTo: destination) // Assuming 'name' is the field for destination
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Get the amount from the first document (assuming each destination is unique)
        setState(() {
          amount = querySnapshot.docs.first['amount'];
        });
      }
    } catch (e) {
      print("Error fetching amount: $e");
    }
  }
@override
  void initState() {
    // TODO: implement initState
  print("hello");
  Ecom().alreadypaid(context);
    super.initState();
  }
  bool validator() {
    return formskey.currentState!.validate();
  }

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: Consumer<Ecom>(
        builder: (BuildContext context,  ecom, child) {
          String fname="";
          String lname="";
          if(ecom.mycarttotal==0){
            ecom.carttotal();
            ecom.cartidmethod();
            print(ecom.currecyval);
          }
         // double convertedamt=double.parse(ecom.cardvalue);
        //  String finalconverted=ecom.numformat.format(convertedamt);
          if(ecom.auth.currentUser!=null){
            String? fullname=ecom.auth.currentUser!.displayName;
            List<String> split=fullname!.split(" ");
            fname=split[1];
            lname=split[0];
            firstname.text=fname;
            lastname.text=lname;
            email.text=ecom.auth.currentUser!.email!;
          }
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(onTap:(){
                Navigator.pushNamed(context, Routes.cart);
              },child: Icon(Icons.arrow_back)),
              backgroundColor: Colors.lightGreen[50],
              centerTitle: true,
              title: const Text('Checkout Form'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 1250,
                          color: Colors.white54,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //const SizedBox(width: 10),
                                Expanded(
                                    flex: 5,
                                    child: Wrap(
                                      spacing: 5,
                                      runSpacing: 5,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            // DropdownButton<String>(
                                            //   hint: const Text("Select Country"),
                                            //   value: ecom.selectedCountry,
                                            //   onChanged: (newValue) {
                                            //     setState(() {
                                            //       ecom.selectedCountry = newValue;
                                            //       ecom.cities = ecom.countryCityData['countries']
                                            //           .firstWhere((country) => country['name'] == newValue)['cities']
                                            //           .cast<String>();
                                            //       ecom.selectedCity = null;
                                            //     });
                                            //   },
                                            //   items: countries.map((String country) {
                                            //     return DropdownMenuItem<String>(
                                            //       value: country,
                                            //       child: Text(country),
                                            //     );
                                            //   }).toList(),
                                            // ),
                                            // SizedBox(height: 20),
                                            // DropdownButton<String>(
                                            //   hint: const Text("Select City"),
                                            //   value: ecom.selectedCity,
                                            //   onChanged: (newValue) {
                                            //     setState(() {
                                            //       ecom.selectedCity = newValue;
                                            //     });
                                            //   },
                                            //   items: ecom.cities.map((String city) {
                                            //     return DropdownMenuItem<String>(
                                            //       value: city,
                                            //       child: Text(city),
                                            //     );
                                            //   }).toList(),
                                            // ),
                                            // SizedBox(height: 20),
                                           // Text("Selected Country: $countryValue"),
                                           // Text("Selected State: $stateValue"),
                                            //Text("Selected City: $cityValue"),
                                          ],
                                        ),
                                        Container(
                                          //color: Colors.lightBlue[50],
                                          width: 600,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Billing Details",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                Form(
                                                  key: formskey,
                                                  child: ListView(
                                                    shrinkWrap: true,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: LoginField(
                                                              hintText: 'First Name',
                                                              controller: firstname,
                                                              textInputType: TextInputType.name,
                                                              obscure: false,
                                                              labelText: 'First Name',
                                                              enabled: true,
                                                            ),
                                                          ),
                                                          const SizedBox(width: 16.0),
                                                          Expanded(
                                                            child: LoginField(
                                                              hintText: 'Last Name',
                                                              controller: lastname,
                                                              textInputType: TextInputType.name,
                                                              obscure: false,
                                                              labelText: 'Last Name',
                                                              enabled: true,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 16.0),
                                                      SelectState(
                                                        onCountryChanged: (value) {
                                                          setState(() {
                                                             _selectedCountry = value;
                                                          });
                                                        },
                                                        onStateChanged: (value) {

                                                          setState(() {
                                                            _selectedRegion = value;
                                                          });
                                                        },
                                                        onCityChanged: (value) {
                                                          setState(() {
                                                            _selectedCity = value;
                                                          });
                                                        }, decoration: InputDecoration(
                                                          border: OutlineInputBorder()
                                                      ),
                                                        validation: (myval){
                                                          if(myval.toString().isEmpty){
                                                            return "Field Required";
                                                          }

                                                        },
                                                      ),

                                                      Row(
                                                        children: <Widget>[
                                                          // Expanded(
                                                          //   child: DropdownButtonFormField<String>(
                                                          //     value: _selectedCountry,
                                                          //     onChanged: (value) {
                                                          //       setState(() {
                                                          //         _selectedCountry = value!;
                                                          //         _selectedRegion = _regionsByCountry[value]![0];
                                                          //       });
                                                          //     },
                                                          //     items: _regionsByCountry.keys.map((String country) {
                                                          //       return DropdownMenuItem<String>(
                                                          //         value: country,
                                                          //         child: Text(country),
                                                          //       );
                                                          //     }).toList(),
                                                          //     decoration: InputDecoration(
                                                          //       labelText: 'Country',
                                                          //       enabledBorder: OutlineInputBorder(
                                                          //         borderSide: const BorderSide(
                                                          //           color: Global.borderColor,
                                                          //           width: 1,
                                                          //         ),
                                                          //         borderRadius: BorderRadius.circular(6),
                                                          //       ),
                                                          //       focusedBorder: OutlineInputBorder(
                                                          //         borderSide: const BorderSide(
                                                          //           color: Colors.orange,
                                                          //           width: 1,
                                                          //         ),
                                                          //         borderRadius: BorderRadius.circular(6),
                                                          //       ),
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                          // const SizedBox(width: 16.0),
                                                          // Expanded(
                                                          //   child: DropdownButtonFormField<String>(
                                                          //     value: _selectedRegion,
                                                          //     onChanged: (value) {
                                                          //       setState(() {
                                                          //         _selectedRegion = value!;
                                                          //       });
                                                          //     },
                                                          //     items: _regionsByCountry[_selectedCountry]!.map((String region) {
                                                          //       return DropdownMenuItem<String>(
                                                          //         value: region,
                                                          //         child: Text(region),
                                                          //       );
                                                          //     }).toList(),
                                                          //     decoration: InputDecoration(
                                                          //       labelText: 'Region/State',
                                                          //       enabledBorder: OutlineInputBorder(
                                                          //         borderSide: const BorderSide(
                                                          //           color: Global.borderColor,
                                                          //           width: 1,
                                                          //         ),
                                                          //         borderRadius: BorderRadius.circular(6),
                                                          //       ),
                                                          //       focusedBorder: OutlineInputBorder(
                                                          //         borderSide: const BorderSide(
                                                          //           color: Colors.orange,
                                                          //           width: 1,
                                                          //         ),
                                                          //         borderRadius: BorderRadius.circular(6),
                                                          //       ),
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 16.0),
                                                      LoginField(
                                                        hintText: 'Street Address',
                                                        controller: street,
                                                        textInputType: TextInputType.text,
                                                        obscure: false,
                                                        labelText: 'Street Address',
                                                        enabled: true,
                                                      ),
                                                      const SizedBox(height: 16.0),
                                                      LoginField(
                                                        hintText: 'Postcode/ZIP',
                                                        controller: postcode,
                                                        textInputType: TextInputType.number,
                                                        obscure: false,
                                                        labelText: 'Postcode/ZIP',
                                                        enabled: true,
                                                      ),
                                                      const SizedBox(height: 16.0),
                                                      LoginField(
                                                        hintText: 'Phone',
                                                        controller: contact,
                                                        textInputType: TextInputType.phone,
                                                        obscure: false,
                                                        labelText: 'Phone',
                                                        enabled: true,
                                                      ),
                                                      const SizedBox(height: 16.0),
                                                      LoginField(
                                                        hintText: 'Email',
                                                        controller: email,
                                                        textInputType: TextInputType.emailAddress,
                                                        obscure: false,
                                                        labelText: 'Email', enabled: true,
                                                      ),
                                                      const SizedBox(height: 16),
                                                      StreamBuilder<QuerySnapshot>(
                                                        stream: FirebaseFirestore.instance.collection('delivery').snapshots(),
                                                        builder: (context, snapshot) {
                                                          if (!snapshot.hasData) {
                                                            return const CircularProgressIndicator();
                                                          }

                                                          // Get the documents from the snapshot
                                                          final List<DocumentSnapshot> docs = snapshot.data!.docs;

                                                          // Create a list of dropdown items for destinations
                                                          List<DropdownMenuItem<String>> dropdownItems = docs.map((doc) {
                                                            String destination = doc['destination']; // Assuming 'name' is the field for destination
                                                            return DropdownMenuItem<String>(
                                                              value: destination,
                                                              child: Text(destination),
                                                            );
                                                          }).toList();

                                                          return DropdownButtonFormField<String>(
                                                            validator: (val){
                                                              if(val==null || val.isEmpty){
                                                                return "Select Shipping Destination";
                                                              }
                                                            },

                                                            hint: const Text('Select Destination'),
                                                            value: selectedDestination,
                                                            items: dropdownItems,
                                                            onChanged: (String? newValue) {
                                                              setState(() {
                                                                selectedDestination = newValue;
                                                                // Get the index of the selected item
                                                                selectedIndex = dropdownItems.indexWhere((item) => item.value == newValue);
                                                              });
                                                              // Fetch the amount based on the selected destination
                                                              if (newValue != null) {
                                                                fetchAmount(newValue);
                                                              }
                                                            },
                                                            decoration: InputDecoration(
                                                              labelText: 'Country',
                                                              enabledBorder: OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                  color: Global.borderColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius: BorderRadius.circular(6),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                  color: Colors.orange,
                                                                  width: 1,
                                                                ),
                                                                borderRadius: BorderRadius.circular(6),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      const SizedBox(height: 16),
                                                      const Text(
                                                        "Additional Information",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      const SizedBox(height: 15),
                                                      const Text("Order notes (Optional)"),
                                                      const SizedBox(height: 15),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 150,
                                                        decoration: const BoxDecoration(
                                                          //color: Colors.grey,
                                                          border: Border(
                                                            top: BorderSide(width: 1.0, color: Colors.black54),
                                                            right: BorderSide(width: 1.0, color: Colors.black54),
                                                            bottom: BorderSide(width: 1.0, color: Colors.black54),
                                                            left: BorderSide(width: 1.0, color: Colors.black54),
                                                          ),
                                                        ),
                                                        child: const Padding(
                                                          padding: EdgeInsets.all(8.0),
                                                          child: TextField(
                                                            decoration: InputDecoration(
                                                              contentPadding: EdgeInsets.only(right: 40),
                                                              hintText: 'Notes for your order, e.g. Special notes for delivery...',
                                                              border: InputBorder.none,
                                                            ),
                                                            keyboardType: TextInputType.multiline,
                                                            maxLines: null,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 16.0),
                                                      Row(
                                                        children: [
                                                          Checkbox(
                                                            value: _isChecked,
                                                            onChanged: (bool? value) {
                                                              setState(() {
                                                                _isChecked = value!;
                                                              });
                                                            },
                                                          ),
                                                          const Text(
                                                            'Ship to a different address?',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 16
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 16),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Global.mainColor,
                                                            borderRadius: BorderRadius.circular(6)
                                                        ),
                                                        child: ElevatedButton(
                                                          onPressed: () async{
                                                           if (validator() && amount!=null) {
                                                              String email_txt=email.text.trim().toString();
                                                              String fname_txt=firstname.text.trim().toString();
                                                              String lname_txt=lastname.text.trim().toString();
                                                              String addres_txt=street.text.trim().toString();
                                                              String phone_txt=contact.text.trim().toString();
                                                              String country_txt=_selectedCountry!;
                                                              String region_txt=_selectedRegion!;
                                                              String city_txt=_selectedCity!;
                                                              String postcode_txt=postcode.text.trim().toString();

                                                              final pgress=ProgressHUD.of(context);
                                                              pgress!.show();
                                                              Future.delayed(Duration(seconds: 10),(){
                                                                pgress.dismiss();
                                                              });

                                                              await ecom.checkout(email_txt, fname_txt,lname_txt, addres_txt, phone_txt, country_txt, region_txt, city_txt, postcode_txt,amount!,selectedDestination!);
                                                              double shipping=double.parse(amount!);
                                                              //double paystackvalue=(convertedamt+shipping)*100;

                                                             // ecom.paystacks(phone_txt, "$paystackvalue",ecom.mycardid);

                                                              pgress.dismiss();

                                                            } else {
                                                              print('Form is invalid');
                                                            }
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            fixedSize: const Size(395, 55),
                                                            backgroundColor: Colors.transparent,
                                                            shadowColor: Colors.transparent,
                                                          ),
                                                          child: const Text('Place Order', style: TextStyle(color: Colors.white)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          //color: Colors.lightBlue[50],
                                          width: 600,
                                          child: Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Container(
                                                //color: Colors.lightBlue[50],
                                                //height: 300,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Your Order",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),
                                                    Table(
                                                      border: TableBorder.all(),
                                                      children:  [
                                                        const TableRow(
                                                          children: [
                                                            TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text('Product'),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text('Subtotal'),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        TableRow(
                                                          children: [
                                                            const TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text('Subtotal'),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text("USD ${ecom.cardvalue}"),
                                                              ),
                                                            ),

                                                          ],
                                                        ),
                                                          TableRow(
                                                          children: [
                                                            const TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text('Shipping'),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text("USD ${amount}"),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        TableRow(
                                                          children: [
                                                            const TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text('Total USD'),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text("USD ${double.parse(ecom.cardvalue)+double.parse(amount!)}"),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        TableRow(
                                                          children: [
                                                            const TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text('Total GHS'),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text("GHS ${
                                                                    ((double.parse(ecom.cardvalue)+(double.parse(amount!)))*ecom.currecyval)
                                                                }"),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                    //TableExample()
                                                  ],
                                                ),
                                                //width: 50,
                                              )
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
