import 'dart:ui';

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
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[50],
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
                                  height: 500,
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
                                                    "WHO WE ARE!",
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
                                        const Text("Heritage Baskets Produce Authentic High Quality Handwoven African Bolga Baskets. Our baskets are carefully crafted and ethically handwoven by amazing skilled artisans in Bolgatanga Ghana. Our baskets are made from all-natural sea grass, they are well-designed, durable and user friendly and above all long lasting. Heritage baskets was founded in 24 April, 2019 in the city of Baskets, Bolgatanga, Ghana."),
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
                                      "assets/images/heritage4.jpg",
                                    fit: BoxFit.cover,
                                  )
                                ),
                              ],
                            ),
                            Container(
                              width: 1105,
                              child: const Column(
                                children: [
                                  Text("Heritage Baskets provides access to the highest quality Bolgatanga market baskets. We embrace a new ethical business model, considering everyone as partners in a global transformation."),
                                  SizedBox(height: 8),
                                  Text("Heritage Baskets remains dedicated to supporting the artisan weavers we collaborate with by creating sustainable jobs, fair and meaningful work, and fostering true social impact in the local community. As the fastest-growing continent, Africa has shown tremendous progress, particularly in Bolgatanga, a remote town in Ghana's Upper East Region, "),
                                  SizedBox(height: 8),
                                  Text("Our mission is to celebrate the creativity and excellence of the Gurunee people is more significant than ever. We focus on generating income-earning opportunities for the Gurunee artisans and providing a global marketplace to showcase their exceptional craftsmanship. We honor local basket traditions while innovating with the world's oldest craft, excelling in creating new forms and designs."),
                                  SizedBox(height: 8),
                                  Text("Our commitment to innovation is evident in the evolving patterns, techniques, and dye materials our weavers use. We take time to develop our products, ensuring they are useful, beautiful, and ethical. Our design and development team collaborate closely with Master Weavers to maintain the authenticity and high quality of our basketry. Monthly workshops, skills training, and the weavers' enthusiasm and innovation enable their mastery to be celebrated and sold worldwide. "),
                                  SizedBox(height: 8),
                                  Text("In addition to the exclusive designs available through our online store and global retailers, we are engaging in exciting impact projects. We collaborate with purpose-driven brands, interior designers, art galleries, and hoteliers to create custom colourways and bespoke shapes. We believe baskets are functional art.\nOur weavers are fairly compensated for their craftsmanship, receiving 5-15% of the retail price as a commission in addition to their initial payment, depending on the basket type. "),
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
                                    height: 500,
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
                                    child: Image.asset(
                                      "assets/images/heritage4.jpg",
                                      fit: BoxFit.contain,
                                    )
                                ),
                                Container(
                                  color: Colors.lightGreen[50],
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
                                Container(
                                  color: Colors.white54,
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
                                  color: Colors.lightGreen[50],
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
                                                  "POLICIES - SHIPPING AND PAYMENTS",
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
                                              "Shipping and Payments (International)",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("For most countries, we use DHL or Ghana Post."),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Payments can be made through Visa, MasterCard, Apple Pay, or PayPal"),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Our products are not available for sale in Ghana."),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "SHIPPING FEES",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "SHIPPING VIA GHANA POST OR DHL TO MOST DESTINATIONS",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "ZONE 1 - USA, Europe, Africa",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("15.00 USD per basket"),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Free shipping for orders over 500.00 USD"),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "ZONE 2 - Australia, New Zealand, Middle East, Far East, South America, Central America (including Mexico), and the Caribbean",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14
                                          ),
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("17.00 USD per basket"),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Free shipping for orders over 500.00 USD"),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Additional taxes and duties may apply upon delivery.",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.lightGreen[50],
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
                                                  "Order Processing (International)",
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("After placing your order, you will receive an email confirming receipt."),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Orders undergo a credit card approval process and are not released for shipment until verification is complete, which may affect delivery time."),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("When your order ships, you will receive an email confirmation and receipt, along with a DHL or Ghana Post tracking number. For Ghana Post, tracking information will be provided a few days after shipment."),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Shipping Process",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Credit card authorization and verification are required before processing your order."),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Your basket(s) will be packaged in a poly woven sack, wrapped in cardboard, and secured with ample packing tape. Our packaging is utilitarian and not decorative, designed to meet international courier requirements for cost-effective shipping."),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(" • ", style: TextStyle(fontSize: 30),),
                                            Expanded(
                                              child: Text("Due to high shipping costs, baskets are often packed in a compressed state. Instructions for reshaping the basket will be included. Please do not be alarmed by the basket's initial appearance; they are resilient and can be easily restored to their original shape."),
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
          ],
        ),
      ),
    );
  }
}
