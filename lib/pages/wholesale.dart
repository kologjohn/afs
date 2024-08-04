import 'package:flutter/material.dart';

import '../components/global.dart';
import '../widgets/onhover.dart';

class Wholesale extends StatelessWidget {
  const Wholesale({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[50],
        title: const Text("Wholesale"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      //color: Colors.lightGreen,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                Container(
                                  //height: 500,
                                    width: 550,
                                    decoration: BoxDecoration(
                                      //color: Colors.white,
                                      //color: Colors.lightGreen[50],
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
                                Container(
                                  //color: Colors.lightGreen[50],
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
                                                  "WHOLESALE",
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
                                        SizedBox(height: 16),
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "WELCOME TO HERITAGE BASKETS WHOLESALE",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        const Text("Heritage Baskets offers retail and wholesale access to the finest Bolga Market Baskets. We are committed to an ethical business model, viewing everyone as partners in a global transformation. \n Handwoven in Ghana by our skilled artisans, our baskets are both beautiful and functional. They come in various styles, colours, and sizes, including shopping baskets, laundry baskets, hampers, storage baskets, bicycle baskets, and decorative pieces."),
                                        const SizedBox(height: 8),
                                        const Text("Here, artistry, culture, and tradition come together to set industry standards for design innovation, quality craftsmanship, fair compensation, customer service, and environmental sustainability. Discover our Fairtrade wholesale collection of home goods and fashion accessories, crafted with passion and excellence from the heart of Ghana. We invite you to explore!"),
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
          ],
        ),
      ),
    );
  }
}
