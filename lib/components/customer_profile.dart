import 'package:africanstraw/components/global.dart';
import 'package:africanstraw/components/shimmer.dart';
import 'package:africanstraw/controller/controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/route.dart';

class CustomerProfilePage extends StatelessWidget {
  const CustomerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Ecom>(
      builder: (BuildContext context, value, Widget? child){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue[50],
            title: const Text('Customer Profile'),
            centerTitle: true,
          ),
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 60.0),
                child: Column(
                  children: [
                    // Profile Picture and Name
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  width: 300,
                                  height: 60,
                                  color: Colors.transparent,
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 900,
                                  height: 250,
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 80,
                                        ),
                                        Text(
                                          value.auth.currentUser!.displayName.toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        //const SizedBox(height: 30),
                                        const SizedBox(height: 5),
                                         Text("${value.auth.currentUser?.email}", style: TextStyle(color: Colors.grey)),
                                        const SizedBox(height: 5),
                                         Text(
                                          '${value.phoneNumber}',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Global.mainColor,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                              elevation: MaterialStateProperty.all(0),
                                            ),
                                            child: const Text('Edit Profile', style: TextStyle(color: Colors.white),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 0, // Adjust the position as needed
                              child: CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.lightGreen,
                                backgroundImage: value.auth.currentUser!.photoURL != null
                                    ? NetworkImage(value.auth.currentUser!.photoURL!)
                                    : null, // Fallback if no photo is available
                                onBackgroundImageError: (exception, stackTrace) {
                                  print("Failed to load profile picture: $exception");
                                },
                                child: value.auth.currentUser!.photoURL == null
                                    ? Icon(Icons.account_circle, size: 80, color: Colors.white) // Default icon
                                    : null, // No child if the image exists
                              ),
                            ),



                          ],
                        )
                      ],
                    ),

                    const SizedBox(height: 20),

                    Container(
                      width: 900,
                      color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Account Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            ListTile(
                              leading: const Icon(Icons.location_on),
                              title: const Text('Shipping Address'),
                              subtitle: const Text('Commercial St, Bolga, Ghana'),
                              trailing: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                              child: Divider(
                                color: Colors.grey[200],
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.payment),
                              title: const Text('Billing Address'),
                              subtitle: const Text('Commercial St, Bolga, Ghana'),
                              trailing: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                              child: Divider(
                                color: Colors.grey[200],
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.credit_card),
                              title: const Text('Payment Method'),
                              subtitle: const Text('**** **** **** 1234'),
                              trailing: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 900,
                      color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Pending Orders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            FutureBuilder<QuerySnapshot>(
                                future: value.db.collection("checkout").where('email', isEqualTo: value.auth.currentUser!.email.toString()).where('status', isEqualTo: false).get(),
                                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Text("No Pending Records",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),);
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}'
                                    );
                                  }
                                  return Container(
                                    height: 200,
                                    child: ListView.builder(
                                      itemCount:snapshot.data!.docs.length ,
                                      itemBuilder: (BuildContext context, int index,) {
                                        final data=snapshot.data!.docs[index];
                                        String total="";
                                        String cartid="";
                                        try{
                                          total=data['total'];
                                          cartid=data['cartid'];

                                        }catch(e){
                                          print(e);
                                        }
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            //const Text('Order History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                            //const SizedBox(height: 10),
                                            ListTile(
                                              leading: const Icon(Icons.shopping_cart),
                                              title: Text('Cart ID: $cartid'),
                                              subtitle: const Text('Placed on: Sep 20, 2024'),
                                              trailing: Text('\$$total', style: const TextStyle(fontSize: 18)),
                                              onTap: () {},
                                            ),
                                            Divider(color: Colors.grey[200])
                                          ],
                                        );

                                      },
                                    ),
                                  );
                                }

                            )
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      height: 200,
                      width: 900,
                      color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FutureBuilder<QuerySnapshot>(
                          future: value.db.collection("checkout").where('email', isEqualTo: value.auth.currentUser!.email).where('status', isEqualTo: true).get(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData) {
                              return const Text('No orders found');
                            }

                              return ListView.builder(
                                itemCount:snapshot.data!.docs.length ,
                                itemBuilder: (BuildContext context, int index,) {
                                  final data=snapshot.data!.docs[index];
                                  String total="";
                                  String cartid="";
                                  try{
                                    total=data['total'];
                                    cartid=data['cartid'];

                                  }catch(e){
                                      print(e);
                                  }

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Order History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 10),
                                      Column(
                                        children: [
                                          ListTile(
                                            leading: const Icon(Icons.shopping_cart),
                                            title: Text('Cart ID: $cartid'),
                                            subtitle: const Text('Placed on: Sep 20, 2024'),
                                            trailing: Text('\$$total', style: const TextStyle(fontSize: 18)),
                                            onTap: () {},
                                          ),
                                          Divider(color: Colors.grey[200]),
                                        ],
                                      )
                                    ],
                                  );

                                },
                              );
                            }

                        )

                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 900,
                      color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Settings & Preferences', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            ListTile(
                              leading: const Icon(Icons.lock),
                              title: const Text('Change Password'),
                              onTap: () {},
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                              child: Divider(
                                color: Colors.grey[200],
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.notifications),
                              title: const Text('Notification Preferences'),
                              onTap: () {},
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                              child: Divider(
                                color: Colors.grey[200],
                              ),
                            ),
                            InkWell(
                                onTap: ()async{
                                 await value.signout(context);
                                },
                              child: const ListTile(
                                leading: Icon(Icons.exit_to_app),
                                title: Text('Log Out'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}