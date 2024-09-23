import 'package:africanstraw/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/global.dart';
import '../constanst.dart';
import '../widgets/social_media_icons.dart';

class TabletFooter extends StatelessWidget {
  const TabletFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Ecom>(builder: (context, value, child) {
      return Container(
        height: 400,
        color: Colors.lightBlue[50],
        child:  Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: SizedBox(
                        height: 200,
                        //color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Companydata.companyname, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                            const SizedBox(height: 20),
                            Expanded(child: Text("Address: ${value.companyaddress}"),),
                            const SizedBox(height: 15),
                            Expanded(child: Text("Phone: ${value.companyphone}"),),
                            const SizedBox(height: 15),
                            Expanded(child: Text("Email: ${value.companyemail}")),
                          ],
                        ),
                      )
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: SizedBox(
                      height: 250,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "USEFUL LINKS",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            SizedBox(height: 20),

                            // First Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text("About Us", overflow: TextOverflow.ellipsis),
                                ),
                                Flexible(
                                  child: Text("Who We Are", overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),

                            SizedBox(height: 15),

                            // Second Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text("Secure Products", overflow: TextOverflow.ellipsis),
                                ),
                                Flexible(
                                  child: Text("Project", overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),

                            SizedBox(height: 15),

                            // Third Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text("About Our Shop", overflow: TextOverflow.ellipsis),
                                ),
                                Flexible(
                                  child: Text("Our Services", overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),

                            SizedBox(height: 15),

                            // Fourth Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text("Privacy And Policy", overflow: TextOverflow.ellipsis),
                                ),
                                Flexible(
                                  child: Text("SiteMap", overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),

                            SizedBox(height: 15),

                            // Fifth Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text("Delivery Information", overflow: TextOverflow.ellipsis),
                                ),
                                Flexible(
                                  child: Text("Contact", overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      child: SizedBox(
                        height: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("JOIN OUR NEWSLETTER NOW", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                            const SizedBox(height: 20),
                            const Text("Get E-mail updates about our latest shop and special offers."),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Expanded(
                                    flex: 2,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Enter your mail',
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: InputBorder.none
                                      ),
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      height: 50,
                                      color: Global.mainColor,
                                      child: const Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FittedBox(child: Text("SUBSCRIBE", style: TextStyle(color: Colors.white),)),
                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal, // or vertical depending on your layout
                              child: Row(
                                children: const [
                                  SocialMediaIcons(),
                                ],
                              ),
                            ),

                          ],
                        ),
                        //color: Colors.red,
                      )
                  ),
                ],
              ),
              const Divider(),
              FittedBox(
                fit: BoxFit.contain,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text('Copyright ©2024 All rights reserved', style: TextStyle(fontSize: 15),),
                        SizedBox(width: 10),
                        Text('|'),
                        SizedBox(width: 10),
                        Text('Powered By KologSoft', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Row(
                      children: [
                        Image.asset("assets/images/visa1.png", height: 50,),
                        const SizedBox(width: 10),
                        Image.asset("assets/images/PayPal.png", height: 50,),
                        const SizedBox(width: 10),
                        Image.asset("assets/images/MasterCard1.png", height: 50,),
                        //Image.asset("assets/images/payout.png", height: 100,)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    );
  }
}
