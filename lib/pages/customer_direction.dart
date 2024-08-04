import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/global.dart';
import '../widgets/onhover.dart';

class CustomerDirection extends StatelessWidget {
  const CustomerDirection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[50],
        title: const Text("Customer Direction"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                                    height: 500,
                                    width: 550,
                                    decoration: const BoxDecoration(
                                      //color: Colors.white,
                                      //color: Colors.lightGreen[50],
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
                                      border: Border(
                                        top: BorderSide(color: Colors.black, width: 1.0), // Top border
                                        left: BorderSide(color: Colors.black, width: 1.0), // Left border
                                        right: BorderSide(color: Colors.black, width: 1.0), // Right border
                                        bottom: BorderSide(color: Colors.black, width: 1.0), // Bottom border
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/images/heritage6.png",
                                      fit: BoxFit.contain,
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
                                                  "CUSTOMER SERVICE",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18
                                                  ),
                                                ),
                                                Container(
                                                  width: 70,
                                                  height: 3,
                                                  color: Global.mainColor,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        const Text("At Heritage Baskets, we pride ourselves on exceptional customer service and providing the highest quality handwoven baskets from Bolgatanga, Ghana."),
                                        const SizedBox(height: 8),
                                        const Text("We strive to ensure your order arrives quickly, complete, beautiful, and undamaged.\nIf you encounter any issues with your order, please contact us so we can resolve them promptly."),
                                        const SizedBox(height: 8),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("You will receive the exact basket pictured when you purchase from the Heritage Baskets online store."),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Please note that colours may vary slightly depending on your screen’s calibration."),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("•	Some baskets may need reshaping upon arrival. To reshape, submerge the basket in water (avoid wetting the leather handles), reshape, and let it dry"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.lightGreen[50],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                Container(
                                  //color: Colors.white54,
                                  //height: 500,
                                  width: 550,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "RETURN POLICY",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18
                                                  ),
                                                ),
                                                Container(
                                                  width: 70,
                                                  height: 3,
                                                  color: Global.mainColor,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        const Text("Our return policy is effective for 7 days after you receive your purchase."),
                                        const SizedBox(height: 8),
                                        const Text("You can apply for a refund for the following reasons:"),
                                        const SizedBox(height: 8),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("You received the wrong basket(s) (not the basket(s) you ordered)."),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Your basket(s) was damaged during shipping."),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Your basket was defective or damaged before shipping, and we didn’t notice it."),
                                            ),
                                          ],
                                        ),
                                        const Text("To apply for a refund, send us high-quality photos of the damaged basket(s) and each of the six sides of the shipping box within 7 days of receiving your order."),
                                        const SizedBox(height: 4),
                                        const Text("Once we confirm the damage occurred during shipping or before, we will initiate the return process. Alternatively, we might offer a quicker and more efficient solution that satisfies both you and Heritage Baskets, instead of a refund."),
                                        const SizedBox(height: 4),
                                        const Text("To complete your return, we require a receipt as proof of purchase. The return shipping costs for the damaged or incorrect basket(s) to Baba Tree in Bolgatanga, Ghana, will be covered by us.")
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    //height: 500,
                                    width: 550,
                                    decoration: BoxDecoration(
                                      //color: Colors.white,
                                      color: Colors.lightGreen[50],
                                      // border: const Border(
                                      //   top: BorderSide(color: Colors.white, width: 10.0), // Top border
                                      //   left: BorderSide(color: Colors.white, width: 10.0), // Left border
                                      //   right: BorderSide(color: Colors.white, width: 10.0), // Right border
                                      //   bottom: BorderSide(color: Colors.white, width: 10.0), // Bottom border
                                      // ),
                                    ),
                                    child: const Column(
                                      children: [
                                        Wrap(
                                          spacing: 15,
                                          runSpacing: 15,
                                          children: [
                                            HoverPopUpContainer(imgPath: 'assets/images/heritage1.jpg',),
                                            HoverPopUpContainer(imgPath: 'assets/images/heritage2.jpg',),
                                            HoverPopUpContainer(imgPath: 'assets/images/heritage3.jpg',),
                                            HoverPopUpContainer(imgPath: 'assets/images/heritage4.jpg',),
                                          ],
                                        )
                                      ],
                                    )
                                ),
                              ],
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
