import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/global.dart';
import '../constanst.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[50],
        title: const Text("TERMS AND CONDITIONS"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 100),
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
                            const SizedBox(height: 80),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.start,
                                        //   children: [
                                        //     Column(
                                        //       crossAxisAlignment: CrossAxisAlignment.start,
                                        //       children: [
                                        //         const Text(
                                        //           "TERMS AND CONDITIONS",
                                        //           style: TextStyle(
                                        //               color: Colors.black,
                                        //               fontWeight: FontWeight.bold,
                                        //               fontSize: 18
                                        //           ),
                                        //         ),
                                        //         Container(
                                        //           width: 70,
                                        //           height: 3,
                                        //           color: Global.mainColor,
                                        //         )
                                        //       ],
                                        //     )
                                        //   ],
                                        // ),
                                        Text(Companydata.termsAndConditions, style: const TextStyle(fontSize: 16),),
                                        const SizedBox(height: 5),
                                        const Text(
                                            "Website Use",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 17
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("  • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("This website's content is subject to change at any time without prior notice. The website offers usage and general information. Despite our best efforts to maintain the information's accuracy and timeliness, we disclaim all express and implied warranties and representations regarding the website's accuracy, completeness, suitability, dependability, or availability of its content, including any related graphics, products, or information, for any purpose.", style: const TextStyle(fontSize: 16)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("  • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Your use of any information or content on this website is not subject to our liability. It is your responsibility to make sure that any goods, services, or information obtained via this website fulfils your unique needs.", style: const TextStyle(fontSize: 16)),
                                            ),
                                          ],
                                        ),
                                        // const SizedBox(height: 20),
                                        // FittedBox(
                                        //   child: Row(
                                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       Container(
                                        //         height: 100,
                                        //         width: 250,
                                        //         color: Colors.grey[200],
                                        //         child: const Padding(
                                        //           padding: EdgeInsets.all(8.0),
                                        //           child: Column(
                                        //             mainAxisAlignment: MainAxisAlignment.center,
                                        //             children: [
                                        //               Text(
                                        //                 "120+",
                                        //                 style: TextStyle(
                                        //                     color: Colors.black,
                                        //                     fontSize: 22,
                                        //                     fontWeight: FontWeight.bold
                                        //                 ),
                                        //               ),
                                        //               Text("UNIQUE PRODUCTS"),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       const SizedBox(width: 20),
                                        //       Container(
                                        //         height: 100,
                                        //         width: 250,
                                        //         color: Colors.grey[200],
                                        //         child: const Padding(
                                        //           padding: EdgeInsets.all(8.0),
                                        //           child: Column(
                                        //             mainAxisAlignment: MainAxisAlignment.center,
                                        //             children: [
                                        //               Text(
                                        //                 "12k+",
                                        //                 style: TextStyle(
                                        //                     color: Colors.black,
                                        //                     fontSize: 22,
                                        //                     fontWeight: FontWeight.bold
                                        //                 ),
                                        //               ),
                                        //               Text("HAPPY CUSTOMERS"),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        // const SizedBox(height: 18),
                                        // FittedBox(
                                        //   child: Row(
                                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       Container(
                                        //         height: 100,
                                        //         width: 250,
                                        //         color: Colors.grey[200],
                                        //         child: const Padding(
                                        //           padding: EdgeInsets.all(8.0),
                                        //           child: Column(
                                        //             mainAxisAlignment: MainAxisAlignment.center,
                                        //             children: [
                                        //               Text(
                                        //                 "120+",
                                        //                 style: TextStyle(
                                        //                     color: Colors.black,
                                        //                     fontSize: 22,
                                        //                     fontWeight: FontWeight.bold
                                        //                 ),
                                        //               ),
                                        //               Text("UNIQUE PRODUCTS"),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       const SizedBox(width: 20),
                                        //       Container(
                                        //         height: 100,
                                        //         width: 250,
                                        //         color: Colors.grey[200],
                                        //         child: const Padding(
                                        //           padding: EdgeInsets.all(8.0),
                                        //           child: Column(
                                        //             mainAxisAlignment: MainAxisAlignment.center,
                                        //             children: [
                                        //               Text(
                                        //                 "12k+",
                                        //                 style: TextStyle(
                                        //                     color: Colors.black,
                                        //                     fontSize: 22,
                                        //                     fontWeight: FontWeight.bold
                                        //                 ),
                                        //               ),
                                        //               Text("HAPPY CUSTOMERS"),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        SizedBox(height: 5),
                                        const Text(
                                          "Intellectual Property",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 17
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("  • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("The materials, design, layout, look, appearance, and graphics on this website are owned by or licensed to us. Reproduction is only permitted if it adheres to the copyright notice below, which forms part of these terms and conditions.", style: TextStyle(fontSize: 16)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("  • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Any trademarks reproduced in this website that are not the property of, or licensed to, African Straw Enterprise Ltd are acknowledged on the website.", style: TextStyle(fontSize: 16)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("  • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Unauthorized use of this website may result in a claim for damages and/or be a criminal offense.", style: TextStyle(fontSize: 16)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 500,
                                    width: 550,
                                    decoration: const BoxDecoration(
                                      //color: Colors.white,
                                      //color: Colors.lightGreen[50],
                                      border: Border(
                                        top: BorderSide(color: Colors.white, width: 10.0), // Top border
                                        left: BorderSide(color: Colors.white, width: 10.0), // Left border
                                        right: BorderSide(color: Colors.white, width: 10.0), // Right border
                                        bottom: BorderSide(color: Colors.white, width: 10.0), // Bottom border
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/svg/terms.svg',
                                      width: 200,
                                      height: 400,
                                    ),
                                ),
                              ],
                            ),
                            Container(
                              width: 1105,
                              child:  const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    "Legal Jurisdiction",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      Expanded(
                                        child: Text("Any interaction with this website and any dispute arising from such use of the website is subject to the laws of Ghana.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      Expanded(
                                        child: Text("African Straw Enterprise Ltd makes every effort to keep the website operational. However, we take no responsibility or liability for the website being temporarily unavailable due to technical issues beyond our control", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),

                                  Text(
                                    "Content Usage",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      Expanded(
                                        child: Text("You may not distribute or commercially exploit the website content without permission.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Copyright Notice",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      Expanded(
                                        child: Text("This website and its content are copyright African Straw Enterprise Ltd ‘’Copyright’’ 2024. All rights reserved.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      Expanded(
                                        child: Text("Any redistribution or reproduction of part or all of the contents in any form is prohibited except for the following:", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  Text("        1.	You may print or download content for your personal and non-commercial use only.", style: TextStyle(fontSize: 16)),
                                  Text("        2.	You may share the content with individual third parties for their personal, non-commercial use, but only if you acknowledge the website as the source of the material.", style: TextStyle(fontSize: 16)),

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
          ],
        ),
      ),
    );
  }
}
