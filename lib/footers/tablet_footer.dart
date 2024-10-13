import 'package:africanstraw/widgets/route.dart';
import 'package:flutter/material.dart';
import '../components/global.dart';
import '../constanst.dart';
import '../widgets/social_media_icons.dart';

class TabletFooter extends StatelessWidget {
  final value;
  const TabletFooter({
    super.key, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.lightBlue[50],
      child: Column(
        children: [
          // Use Wrap instead of Row to allow wrapping on smaller screens
          Wrap(
            spacing: 8.0, // Space between items
            runSpacing: 16.0, // Space between lines
            children: [
              // First Column
              SizedBox(
                width: screenWidth < 600 ? screenWidth : screenWidth / 3 - 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Companydata.companyname,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Text("Address: ${value.companyaddress}"),
                    const SizedBox(height: 15),
                    Text("Phone: ${value.companyphone}"),
                    const SizedBox(height: 15),
                    Text("Email: ${value.companyemail}"),
                  ],
                ),
              ),

              // Second Column - Useful Links
              SizedBox(
                width: screenWidth < 600 ? screenWidth : screenWidth / 3 - 16,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "USEFUL LINKS",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      buildUsefulLinks(context),
                    ],
                  ),
                ),
              ),

              // Third Column - Newsletter
              SizedBox(
                width: screenWidth < 600 ? screenWidth : screenWidth / 3 - 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "JOIN OUR NEWSLETTER NOW",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    const Text("Get E-mail updates about our latest shop and special offers."),
                    const SizedBox(height: 15),
                    buildNewsletterSubscription(),
                    const SizedBox(height: 15),
                    buildSocialIcons(),
                  ],
                ),
              ),
            ],
          ),

          const Divider(),

          // Footer Bottom Section
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    children: [
                      const Text('Copyright ©2024 All rights reserved', style: TextStyle(fontSize: 15)),
                      const SizedBox(width: 10),
                      const Text('|'),
                      const SizedBox(width: 10),
                      const Text('Powered By KologSoft', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                buildPaymentIcons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUsefulLinks(BuildContext context) {
    return Column(
      children:  [
        InkWell(onTap:(){
          Navigator.pushNamed(context, Routes.brand);
        },child: buildLinkRow("About Us", "")),
        SizedBox(height: 15),
        InkWell(onTap:(){
          Navigator.pushNamed(context, Routes.mainShop);
        },child: buildLinkRow("About Our Shop", "")),
        SizedBox(height: 15),
        InkWell(onTap:(){
          Navigator.pushNamed(context, Routes.terms);
        },child: buildLinkRow("Privacy And Policy", "")),
        SizedBox(height: 15),
        InkWell(onTap:(){
          Navigator.pushNamed(context, Routes.shipping);
        },child: buildLinkRow("Shipping  Process", "")),
      ],
    );
  }

  static Widget buildLinkRow(String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text(leftText, overflow: TextOverflow.ellipsis)),
        Flexible(child: Text(rightText, overflow: TextOverflow.ellipsis)),
      ],
    );
  }

  Widget buildNewsletterSubscription() {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your mail',
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            color: Global.mainColor,
            child: const Center(
              child: FittedBox(
                child: Text(
                  "SUBSCRIBE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSocialIcons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          SocialMediaIcons(),
        ],
      ),
    );
  }

  Widget buildPaymentIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/visa1.png", height: 50),
        const SizedBox(width: 10),
        Image.asset("assets/images/PayPal.png", height: 50),
        const SizedBox(width: 10),
        Image.asset("assets/images/MasterCard1.png", height: 50),
      ],
    );
  }
}
