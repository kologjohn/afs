import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeliveryDropdown extends StatefulWidget {
  @override
  _DeliveryDropdownState createState() => _DeliveryDropdownState();
}

class _DeliveryDropdownState extends State<DeliveryDropdown> {
  String? selectedDestination;  // Holds the selected destination
  int? amount;  // Holds the fetched amount based on the selected destination
  int? selectedIndex;  // Holds the index of the selected item

  // Fetch the amount when a destination is selected
  Future<void> fetchAmount(String destination) async {
    try {
      // Query Firestore for the document with the selected destination
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('delivery')
          .where('name', isEqualTo: destination) // Assuming 'name' is the field for destination
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Dropdown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dropdown for selecting destination
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
                  String destination = doc['name']; // Assuming 'name' is the field for destination
                  return DropdownMenuItem<String>(
                    value: destination,
                    child: Text(destination),
                  );
                }).toList();

                return DropdownButton<String>(
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
                );
              },
            ),

            // Display the selected index
            SizedBox(height: 20),
            if (selectedIndex != null)
              Text(
                'Selected Index: $selectedIndex',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

            // Display the fetched amount
            SizedBox(height: 20),
            if (amount != null)
              Text(
                'Amount: \$${amount.toString()}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DeliveryDropdown(),
  ));
}
