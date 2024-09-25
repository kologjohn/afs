import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/controller.dart';
import '../widgets/menu_type.dart';

FutureBuilder<QuerySnapshot<Object?>> Categories(Ecom value) {
  return FutureBuilder<QuerySnapshot>(
    future: value.db.collection("category").get(), // Fetch data from Firestore as a Future
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Show a loading indicator while the data is being fetched
        return CircularProgressIndicator();
      }

      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        // Handle the case when there's no data
        return Text("No data yet");
      }

      // If data is available, build the list
      return ListView.builder(
        itemCount: snapshot.data!.docs.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          String categoryName = snapshot.data!.docs[index]['name']; // Fetch category name from Firestore document

          return InkWell(
            onTap: () {}, // Define your onTap functionality here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      value.selected_category(categoryName); // Handle category selection
                      //shoenum = categoryName;
                    },
                    child: MenuType(
                      isSelected: false,
                      coffeeType: categoryName, // Pass the category name to the MenuType widget
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey[200],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
