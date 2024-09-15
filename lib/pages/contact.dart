import 'package:africanstraw/components/global.dart';
import 'package:africanstraw/constanst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
        backgroundColor: Colors.lightBlue[50],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 80.0, bottom: 100),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 1000,
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Text("NEED HELP?", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Global.mainColor),),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                const Text("AFS is looking forward to assisting you in any query you may have about your shopping, Payment, order or Delivery, Returns, and Refunds. Please don't hesitate to contact us during our working times.", style: TextStyle(fontSize: 16),),
                                const SizedBox(height: 30),
                                Container(
                                  child: Image.asset("assets/images/contact.png"),
                                ),
                                const SizedBox(height: 30),
                                const Row(
                                  children: [
                                    Text("Our working hours are:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                const Text("We will always reply to your inquiry in a short while. You can also use our LIVE CHAT Feature to speak with one of our representatives. Please feel free to contact us!", style: TextStyle(fontSize: 16)),
                                const SizedBox(height: 20),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset("assets/images/whatsapp.png", fit: BoxFit.contain, color: Colors.white,),
                                                  // Icon(Icons.whatshot, color: Colors.white, size: 30,),
                                                  // SizedBox(width: 8),
                                                  // Text("WHATSAPP", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                                ],
                                              )
                                          ),
                                        ),
                                        const SizedBox(width: 30),
                                        Container(
                                          height: 60,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Icon(Icons.email, color: Colors.white, size: 40,),
                                                  const SizedBox(width: 8),
                                                  Text(Companydata.email, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                                                ],
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
