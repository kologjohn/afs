import 'package:africanstraw/components/global.dart';
import 'package:flutter/material.dart';

class CustomerProfilePage extends StatelessWidget {
  const CustomerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0, bottom: 60.0),
            child: Column(
              children: [
                // Profile Picture and Name
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/A8A0463.jpg"),
                ),
                const SizedBox(height: 10),
                const Text(
                  'African Straw',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text('africanstrawenterprise@yahoo.com', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 5),
                const Text(
                  '+233 243 972280',
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

                const SizedBox(height: 40),

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
                        const Text('Cart / Pending Orders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        ListTile(
                          leading: Image.asset("assets/images/A8A0463.jpg"),
                          title: const Text('Item 1 - \$30'),
                          subtitle: const Text('Quantity: 2'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                          child: Divider(
                            color: Colors.grey[200],
                          ),
                        ),
                        ListTile(
                          leading: Image.asset("assets/images/A8A0463.jpg"),
                          title: const Text('Item 2 - \$50'),
                          subtitle: const Text('Quantity: 1'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {},
                              ),
                            ],
                          ),
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
                            child: const Text('Proceed To Checkout', style: TextStyle(color: Colors.white),),
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
                        const Text('Order History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        ListTile(
                          leading: const Icon(Icons.shopping_cart),
                          title: const Text('Order #12345645543'),
                          subtitle: const Text('Placed on: Sep 20, 2024'),
                          trailing: const Text('\$120', style: TextStyle(fontSize: 18),),
                          onTap: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                          child: Divider(
                            color: Colors.grey[200],
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.shopping_cart),
                          title: const Text('Order #69845645543'),
                          subtitle: const Text('Placed on: Aug 30, 2024'),
                          trailing: const Text('\$50', style: TextStyle(fontSize: 18),),
                          onTap: () {},
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
                        ListTile(
                          leading: const Icon(Icons.exit_to_app),
                          title: const Text('Log Out'),
                          onTap: () {},
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
}