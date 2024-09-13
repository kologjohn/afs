import 'dart:ui';

import 'package:africanstraw/constanst.dart';
import 'package:africanstraw/controller/dbfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:africanstraw/components/global.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        title: const Text("About Us"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white54,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                Container(
                                  color: Colors.white54,
                                  //height: 500,
                                  width: 550,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                const Text(
                                                    "WHO WE ARE!",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                  ),
                                                ),
                                                Container(
                                                  width: 50,
                                                  height: 3,
                                                  color: Global.mainColor,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                         Text(Companydata.aboutus, style: const TextStyle(fontSize: 16)),
                                        const SizedBox(height: 20),
                                        FittedBox(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 100,
                                                width: 250,
                                                color: Colors.grey[200],
                                                child: const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                          "120+",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 22,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      Text("UNIQUE PRODUCTS"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Container(
                                                height: 100,
                                                width: 250,
                                                color: Colors.grey[200],
                                                child: const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                          "12k+",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 22,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      Text("HAPPY CUSTOMERS"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 18),
                                        FittedBox(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 100,
                                                width: 250,
                                                color: Colors.grey[200],
                                                child: const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "120+",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 22,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      Text("UNIQUE PRODUCTS"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Container(
                                                height: 100,
                                                width: 250,
                                                color: Colors.grey[200],
                                                child: const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "12k+",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 22,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      Text("HAPPY CUSTOMERS"),
                                                    ],
                                                  ),
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
                                  height: 500,
                                  width: 550,
                                    decoration: BoxDecoration(
                                      //color: Colors.white,
                                      color: Colors.lightGreen[50],
                                      border: const Border(
                                        top: BorderSide(color: Colors.white, width: 10.0), // Top border
                                        left: BorderSide(color: Colors.white, width: 10.0), // Left border
                                        right: BorderSide(color: Colors.white, width: 10.0), // Right border
                                        bottom: BorderSide(color: Colors.white, width: 10.0), // Bottom border
                                      ),
                                    ),
                                  child: Image.asset(
                                      "assets/images/aboutus.png",
                                    fit: BoxFit.cover,
                                  )
                                ),
                              ],
                            ),
                            Container(
                              width: 1105,
                              child:  Column(
                                children: [
                                  const Align(alignment: Alignment.topLeft,child: Text("Sustainable Elegance",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 70,
                                      height: 3,
                                      color: Global.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(Companydata.aboutus1, style: const TextStyle(fontSize: 16)),
                                  const SizedBox(height: 12),
                                  const Align(alignment: Alignment.topLeft, child: Text("Unique Beauty for Your Home",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 70,
                                      height: 3,
                                      color: Global.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(Companydata.aboutus2, style: const TextStyle(fontSize: 16)),
                                  const SizedBox(height: 12),
                                  const Align(alignment: Alignment.topLeft, child: Text("Join Us in Celebrating Tradition",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 70,
                                      height: 3,
                                      color: Global.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(Companydata.aboutus3, style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 80),
            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Expanded(
            //         child: Container(
            //           color: Colors.lightGreen[50],
            //           child: Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Column(
            //               children: [
            //                 Wrap(
            //                   spacing: 5,
            //                   runSpacing: 5,
            //                   children: [
            //                     Container(
            //                       color: Colors.lightGreen[50],
            //                       //height: 500,
            //                       width: 550,
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(8.0),
            //                         child: Column(
            //                           children: [
            //                             Row(
            //                               mainAxisAlignment: MainAxisAlignment.start,
            //                               children: [
            //                                 Column(
            //                                   crossAxisAlignment: CrossAxisAlignment.start,
            //                                   children: [
            //                                     const Text(
            //                                       "POLICIES - SHIPPING AND PAYMENTS",
            //                                       style: TextStyle(
            //                                           color: Colors.black,
            //                                           fontWeight: FontWeight.bold,
            //                                           fontSize: 18
            //                                       ),
            //                                     ),
            //                                     Container(
            //                                       width: 70,
            //                                       height: 3,
            //                                       color: Global.mainColor,
            //                                     )
            //                                   ],
            //                                 )
            //                               ],
            //                             ),
            //                             SizedBox(height: 16),
            //                             const Row(
            //                               mainAxisAlignment: MainAxisAlignment.start,
            //                               children: [
            //                                 Text(
            //                                   "Shipping and Payments (International)",
            //                                   style: TextStyle(
            //                                       color: Colors.black,
            //                                       fontWeight: FontWeight.bold,
            //                                       fontSize: 16
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                             const SizedBox(height: 8),
            //                             const Row(
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(" • ", style: TextStyle(fontSize: 30),),
            //                                 Expanded(
            //                                   child: Text("For most countries, we use DHL or Ghana Post."),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Row(
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(" • ", style: TextStyle(fontSize: 30),),
            //                                 Expanded(
            //                                   child: Text("Payments can be made through Visa, MasterCard, Apple Pay, or PayPal"),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Row(
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(" • ", style: TextStyle(fontSize: 30),),
            //                                 Expanded(
            //                                   child: Text("Our products are not available for sale in Ghana."),
            //                                 ),
            //                               ],
            //                             ),
            //                             const SizedBox(height: 16),
            //                             const Row(
            //                               mainAxisAlignment: MainAxisAlignment.start,
            //                               children: [
            //                                 Text(
            //                                   "SHIPPING FEES",
            //                                   style: TextStyle(
            //                                       color: Colors.black,
            //                                       fontWeight: FontWeight.bold,
            //                                       fontSize: 16
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Row(
            //                               mainAxisAlignment: MainAxisAlignment.start,
            //                               children: [
            //                                 Text(
            //                                   "SHIPPING VIA GHANA POST OR DHL TO MOST DESTINATIONS",
            //                                   style: TextStyle(
            //                                       color: Colors.black,
            //                                       fontWeight: FontWeight.bold,
            //                                       fontSize: 14
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Row(
            //                               mainAxisAlignment: MainAxisAlignment.start,
            //                               children: [
            //                                 Text(
            //                                   "ZONE 1 - USA, Europe, Africa",
            //                                   style: TextStyle(
            //                                       color: Colors.black,
            //                                       fontWeight: FontWeight.bold,
            //                                       fontSize: 14
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Row(
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(" • ", style: TextStyle(fontSize: 30),),
            //                                 Expanded(
            //                                   child: Text("15.00 USD per basket"),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Row(
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(" • ", style: TextStyle(fontSize: 30),),
            //                                 Expanded(
            //                                   child: Text("Free shipping for orders over 500.00 USD"),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Text(
            //                               "ZONE 2 - Australia, New Zealand, Middle East, Far East, South America, Central America (including Mexico), and the Caribbean",
            //                               style: TextStyle(
            //                                   color: Colors.black,
            //                                   fontWeight: FontWeight.bold,
            //                                   fontSize: 14
            //                               ),
            //                             ),
            //                             const Row(
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(" • ", style: TextStyle(fontSize: 30),),
            //                                 Expanded(
            //                                   child: Text("17.00 USD per basket"),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Row(
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(" • ", style: TextStyle(fontSize: 30),),
            //                                 Expanded(
            //                                   child: Text("Free shipping for orders over 500.00 USD"),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Row(
            //                               mainAxisAlignment: MainAxisAlignment.start,
            //                               children: [
            //                                 Text(
            //                                   "Additional taxes and duties may apply upon delivery.",
            //                                   style: TextStyle(
            //                                       color: Colors.black,
            //                                       fontWeight: FontWeight.bold,
            //                                       fontSize: 14
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                     Container(
            //                       color: Colors.lightGreen[50],
            //                       //height: 500,
            //                       width: 550,
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(8.0),
            //                         child: Column(
            //                           children: [
            //                             Row(
            //                               mainAxisAlignment: MainAxisAlignment.start,
            //                               children: [
            //                                 Column(
            //                                   crossAxisAlignment: CrossAxisAlignment.start,
            //                                   children: [
            //                                     const Text(
            //                                       "Order Processing (International)",
            //                                       style: TextStyle(
            //                                           color: Colors.black,
            //                                           fontWeight: FontWeight.bold,
            //                                           fontSize: 18
            //                                       ),
            //                                     ),
            //                                     Container(
            //                                       width: 70,
            //                                       height: 3,
            //                                       color: Global.mainColor,
            //                                     )
            //                                   ],
            //                                 )
            //                               ],
            //                             ),
            //                             SizedBox(height: 16),
            //                             const Row(
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(" • ", style: TextStyle(fontSize: 30),),
            //                                 Expanded(
            //                                   child: Text("After placing your order, you will receive an email confirming receipt."),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Row(
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(" • ", style: TextStyle(fontSize: 30),),
            //                                 Expanded(
            //                                   child: Text("Orders undergo a credit card approval process and are not released for shipment until verification is complete, which may affect delivery time."),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Row(
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(" • ", style: TextStyle(fontSize: 30),),
            //                                 Expanded(
            //                                   child: Text("When your order ships, you will receive an email confirmation and receipt, along with a DHL or Ghana Post tracking number. For Ghana Post, tracking information will be provided a few days after shipment."),
            //                                 ),
            //                               ],
            //                             ),
            //                             const SizedBox(height: 16),
            //                             const Row(
            //                               mainAxisAlignment: MainAxisAlignment.start,
            //                               children: [
            //                                 Text(
            //                                   "Shipping Process",
            //                                   style: TextStyle(
            //                                       color: Colors.black,
            //                                       fontWeight: FontWeight.bold,
            //                                       fontSize: 16
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Row(
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(" • ", style: TextStyle(fontSize: 30),),
            //                                 Expanded(
            //                                   child: Text("Credit card authorization and verification are required before processing your order."),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Row(
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(" • ", style: TextStyle(fontSize: 30),),
            //                                 Expanded(
            //                                   child: Text("Your basket(s) will be packaged in a poly woven sack, wrapped in cardboard, and secured with ample packing tape. Our packaging is utilitarian and not decorative, designed to meet international courier requirements for cost-effective shipping."),
            //                                 ),
            //                               ],
            //                             ),
            //                             const Row(
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 Text(" • ", style: TextStyle(fontSize: 30),),
            //                                 Expanded(
            //                                   child: Text("Due to high shipping costs, baskets are often packed in a compressed state. Instructions for reshaping the basket will be included. Please do not be alarmed by the basket's initial appearance; they are resilient and can be easily restored to their original shape."),
            //                                 ),
            //                               ],
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
