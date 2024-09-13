import 'package:flutter/material.dart';

import '../components/global.dart';
import '../constanst.dart';

class ShippingProcess extends StatelessWidget {
  const ShippingProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        title: const Text("Shipping Process"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 80.0, bottom: 100),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: [
                                  Container(
                                      height: 500,
                                      width: 550,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          top: BorderSide(color: Colors.white54, width: 10.0), // Top border
                                          left: BorderSide(color: Colors.white54, width: 10.0), // Left border
                                          right: BorderSide(color: Colors.white54, width: 10.0), // Right border
                                          bottom: BorderSide(color: Colors.white54, width: 10.0), // Bottom border
                                        ),
                                      ),
                                      child: Image.asset(
                                        "assets/images/shipping-process.png",
                                        fit: BoxFit.cover,
                                      )
                                  ),
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
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Our Step-by-Step Shipping Process",
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
                                          const Text("At African Straw Enterprise Ltd (ASE), we take pride in ensuring your beautifully woven baskets are delivered safely and efficiently. Here is a detailed look at our shipping process, so you know exactly what to expect when you place an order with us.", style: TextStyle(fontSize: 16)),
                                          const SizedBox(height: 20),
                                          FittedBox(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  height: 100,
                                                  width: 250,
                                                  color: Colors.lightBlue[50],
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
                                                  color: Colors.lightBlue[50],
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
                                                  color: Colors.lightBlue[50],
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
                                                  color: Colors.lightBlue[50],
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
                                ],
                              ),
                              const SizedBox(
                                width: 1105,
                                child:  Column(
                                  children: [
                                    Align(alignment: Alignment.topLeft,child: Text("1.  Order Receipt and Confirmation",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                                    // Align(
                                    //   alignment: Alignment.topLeft,
                                    //   child: Container(
                                    //     width: 70,
                                    //     height: 3,
                                    //     color: Colors.grey[200],
                                    //   ),
                                    // ),
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("  • ", style: TextStyle(fontSize: 30),),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Text(" Order Placement: Place your order through our website.", style: TextStyle(fontSize: 16)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("  • ", style: TextStyle(fontSize: 30),),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Text(" Order Confirmation: We will confirm your order details, including item specifications, quantity, and delivery address. ** ORDERS ARE ONLY CONFIRMED WHEN PAYMENT HAS BEEN AUTHORIZED AND VERIFIED **", style: TextStyle(fontSize: 16)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("  • ", style: TextStyle(fontSize: 30),),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Text(" Confirmation Email: Receive an order confirmation email with an estimated shipping date.", style: TextStyle(fontSize: 16)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("2.  Packaging",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    // Align(
                                    //   alignment: Alignment.topLeft,
                                    //   child: Container(
                                    //     width: 70,
                                    //     height: 3,
                                    //     color: Colors.grey[200],
                                    //   ),
                                    // ),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Packaging: Your baskets will be packaged using a poly woven sack, which will be wrapped in a paper box and wrapped again with packing tape to ensure your baskets are protected.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Packaging form: Depending on the basket’s shape and size, some baskets will be folded in compressed forms for shipping feasibility. The video below will show you how to reshape your baskets when you receive them.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("3.  Documentation Preparation",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    // Align(
                                    //   alignment: Alignment.topLeft,
                                    //   child: Container(
                                    //     width: 70,
                                    //     height: 3,
                                    //     color: Colors.grey[200],
                                    //   ),
                                    // ),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Shipping Documents: We prepare all necessary shipping documents, including the commercial invoice and packing list (for bulk purchases).",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("4.  Choosing the Shipping Service",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    // Align(
                                    //   alignment: Alignment.topLeft,
                                    //   child: Container(
                                    //     width: 70,
                                    //     height: 3,
                                    //     color: Colors.grey[200],
                                    //   ),
                                    // ),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Shipping Options: We offer shipping through DHL or GhanaPost based on your preference and destination requirements.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Service Coordination: We coordinate with the chosen shipping service for pickup or drop-off.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("5.  Shipping and Tracking",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    // Align(
                                    //   alignment: Alignment.topLeft,
                                    //   child: Container(
                                    //     width: 70,
                                    //     height: 3,
                                    //     color: Colors.grey[200],
                                    //   ),
                                    // ),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Tracking Number: Once shipped, we will provide you with a tracking number.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Order Management: Tracking information is updated in our system.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Customer Update: We will send you the tracking number and instructions on how to track your package online.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("6.  Delivery Confirmation",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    // Align(
                                    //   alignment: Alignment.topLeft,
                                    //   child: Container(
                                    //     width: 70,
                                    //     height: 3,
                                    //     color: Colors.grey[200],
                                    //   ),
                                    // ),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Shipment Tracking: We track your shipment until it reaches you.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Delivery Confirmation: We confirm delivery with the shipping service.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Customer Notification: You will receive a delivery confirmation email once your package is delivered.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("7.  Customer Service and Support",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    // Align(
                                    //   alignment: Alignment.topLeft,
                                    //   child: Container(
                                    //     width: 70,
                                    //     height: 3,
                                    //     color: Colors.grey[200],
                                    //   ),
                                    // ),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Follow-Up: We follow up to ensure you are satisfied with your purchase.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Issue Resolution: Any issues or concerns are promptly addressed.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Record Keeping: We maintain records of all shipments and interactions for future reference.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("8.  Review and Improve Process",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    // Align(
                                    //   alignment: Alignment.topLeft,
                                    //   child: Container(
                                    //     width: 70,
                                    //     height: 3,
                                    //     color: Colors.grey[200],
                                    //   ),
                                    // ),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Continuous Improvement: We regularly review our shipping process to identify and implement improvements.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Customer Feedback: Your feedback helps us enhance our services.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Divider(),
                                    ),

                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 1105,
                                  child: Text("By outlining this process, ASE aims to provide transparency and peace of mind, ensuring a smooth and reliable shipping experience for our valued customers. If you have any questions or need further assistance, please feel free to contact us!"))
                            ],
                          ),
                        ),
                      )
                  )
                ],
              ),
            )
            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 80),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: Container(
            //             child: Column(
            //               children: [
            //                 Container(
            //                   width: 900,
            //                   child:  const Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       SizedBox(height: 50),
            //                       Text(
            //                         "Our Step-by-Step Shipping Process",
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.bold,
            //                             color: Colors.black,
            //                             fontSize: 17
            //                         ),
            //                       ),
            //                       SizedBox(height: 8),
            //                       Text("At African Straw Enterprise Ltd (ASE), we take pride in ensuring your beautifully woven baskets are delivered safely and efficiently. Here is a detailed look at our shipping process, so you know exactly what to expect when you place an order with us.", style: TextStyle(fontSize: 16),),
            //                       SizedBox(height: 5),
            //                       Text(
            //                         "Order Receipt and Confirmation",
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.bold,
            //                             color: Colors.black,
            //                             fontSize: 17
            //                         ),
            //                       ),
            //                       SizedBox(height: 5),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text("  1. ", style: TextStyle(fontSize: 16),),
            //                           SizedBox(width: 4),
            //                           Expanded(
            //                             child: Text(" Contact Us: Reach out to our customer service team at africanstrawenterprise@gmail.com or 0546768837/03820-97421/0243972280 to request a return. Provide your order number and reason for the return.", style: TextStyle(fontSize: 16)),
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(height: 8),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text("  2. ", style: TextStyle(fontSize: 16),),
            //                           SizedBox(width: 4),
            //                           Expanded(
            //                             child: Text("	Return Authorization: Our team will provide you with a Return Authorization Number (RAN) and detailed return instructions.", style: TextStyle(fontSize: 16)),
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(height: 8),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text("  3. ", style: TextStyle(fontSize: 16),),
            //                           SizedBox(width: 4),
            //                           Expanded(
            //                             child: Text("	Prepare Your Return: Securely pack the basket in their original packaging. Include the receipt and the RAN inside the package.", style: TextStyle(fontSize: 16)),
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(height: 8),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text("  4. ", style: TextStyle(fontSize: 16),),
            //                           SizedBox(width: 4),
            //                           Expanded(
            //                             child: Text("	Ship Your Return: ASE will cover the cost of return shipping. We will provide you with a prepaid shipping label to send your package back to us.", style: TextStyle(fontSize: 16)),
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(height: 12),
            //                       Text(
            //                         "Refunds",
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.bold,
            //                             color: Colors.black,
            //                             fontSize: 17
            //                         ),
            //                       ),
            //                       SizedBox(height: 8),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text("  • ", style: TextStyle(fontSize: 30),),
            //                           SizedBox(width: 4),
            //                           Expanded(
            //                             child: Text(" Check Your Account: If you have not received a refund yet, first check your bank account again.", style: TextStyle(fontSize: 16)),
            //                           ),
            //                         ],
            //                       ),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
            //                           Text("  • ", style: TextStyle(fontSize: 30),),
            //                           SizedBox(width: 4),
            //                           Expanded(
            //                             child: Text(" Contact Your Bank: There is often a processing time before a refund is posted.", style: TextStyle(fontSize: 16)),
            //                           ),
            //                         ],
            //                       ),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text("  • ", style: TextStyle(fontSize: 30),),
            //                           SizedBox(width: 4),
            //                           Expanded(
            //                             child: Text(" Further Assistance: If you have done all of this and still have not received your refund, please contact us at africanstrawenterprise@gmail.com.", style: TextStyle(fontSize: 16)),
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(height: 12),
            //                       Text(
            //                         "Late or Missing Refunds",
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.bold,
            //                             color: Colors.black,
            //                             fontSize: 17
            //                         ),
            //                       ),
            //                       SizedBox(height: 8),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text("  • ", style: TextStyle(fontSize: 30),),
            //                           SizedBox(width: 4),
            //                           Expanded(
            //                             child: Text(" Processing Time: Once your return is received and inspected, we will notify you via email regarding the approval of your refund", style: TextStyle(fontSize: 16)),
            //                           ),
            //                         ],
            //                       ),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
            //                           Text("  • ", style: TextStyle(fontSize: 30),),
            //                           SizedBox(width: 4),
            //                           Expanded(
            //                             child: Text(" Approved Refunds: If approved, your refund will be processed and a credit will be applied to your original method of payment within 10 business days.", style: TextStyle(fontSize: 16)),
            //                           ),
            //                         ],
            //                       ),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text("  • ", style: TextStyle(fontSize: 30),),
            //                           SizedBox(width: 4),
            //                           Expanded(
            //                             child: Text(" Partial Refunds: Partial refunds may be issued for items returned in non-original condition, damaged, or with missing parts not due to our error.", style: TextStyle(fontSize: 16)),
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(height: 12),
            //                       Text(
            //                         "Important Note on Duties and Taxes",
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.bold,
            //                             color: Colors.black,
            //                             fontSize: 17
            //                         ),
            //                       ),
            //                       SizedBox(height: 8),
            //                       Text("Customers are responsible for covering any duties or taxes imposed by their country on imported goods. Please check your local customs regulations for more information", style: TextStyle(fontSize: 16),),
            //                       SizedBox(height: 12),
            //                       Text(
            //                         "Refunds Are Not Available For",
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.bold,
            //                             color: Colors.black,
            //                             fontSize: 17
            //                         ),
            //                       ),
            //                       SizedBox(height: 8),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text("  • ", style: TextStyle(fontSize: 30),),
            //                           SizedBox(width: 4),
            //                           Expanded(
            //                             child: Text(" Notifying us after 3 Days", style: TextStyle(fontSize: 16)),
            //                           ),
            //                         ],
            //                       ),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text("  • ", style: TextStyle(fontSize: 30),),
            //                           SizedBox(width: 4),
            //                           Expanded(
            //                             child: Text(" Damaged Items Due to Misuse: Items that are damaged due to improper use or mishandling by the customer.", style: TextStyle(fontSize: 16)),
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(height: 12),
            //                       Text(
            //                         "Customer Support",
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.bold,
            //                             color: Colors.black,
            //                             fontSize: 17
            //                         ),
            //                       ),
            //                       SizedBox(height: 8),
            //                       Text("For any questions or assistance with your return, please contact our customer service team:", style: TextStyle(fontSize: 16),),
            //                       SizedBox(height: 5),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text("  • ", style: TextStyle(fontSize: 30),),
            //                           Expanded(
            //                             child: Text(" Email: africanstrawenterprise@gmail.com", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            //                           ),
            //                         ],
            //                       ),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text("  • ", style: TextStyle(fontSize: 30),),
            //                           Expanded(
            //                             child: Text(" Phone: +233546768837/03820-97421/+233243972280", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            //                           ),
            //                         ],
            //                       ),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text("  • ", style: TextStyle(fontSize: 30),),
            //                           Expanded(
            //                             child: Text(" Hours: Monday to Friday, 9:00 AM - 5:00 PM (GMT)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(height: 5),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         crossAxisAlignment: CrossAxisAlignment.center,
            //                         children: [
            //                           Expanded(child: Text("Thank you for choosing African Straw Enterprise Ltd. Your satisfaction is our top priority!")),
            //                         ],
            //                       )
            //                     ],
            //                   ),
            //                 )
            //               ],
            //             ),
            //           )
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
