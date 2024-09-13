import 'package:africanstraw/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/global.dart';
import '../widgets/social_media_icons.dart';

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Ecom>(builder: (context, value, child) {
      return Container(
        height: 400,
        color: Colors.lightBlue[50],
        child:  Padding(
          padding: const EdgeInsets.only(left: 130.0, right: 130, top: 50),
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
                            Text(value.companyname, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                            const SizedBox(height: 20),
                            Text("Address: ${value.companyaddress}"),
                            const SizedBox(height: 15),
                            Text("Phone: ${value.companyphone}"),
                            const SizedBox(height: 15),
                            Text("Email: ${value.companyemail}"),
                          ],
                        ),
                      )
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                      child: SizedBox(
                        height: 250,
                        //color: Colors.red,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("USEFUL LINKS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("About Us"),
                                  Text("Who We Are"),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Secure Products"),
                                  Text("Project"),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("About Our Shop"),
                                  Text("Our Services"),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Privacy And Policy"),
                                  Text("SiteMap"),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivery Information"),
                                  Text("Contact"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      child: SizedBox(
                        height: 250,
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
                                          Text("SUBSCRIBE", style: TextStyle(color: Colors.white),),
                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            const SocialMediaIcons(),
                          ],
                        ),
                        //color: Colors.red,
                      )
                  ),
                ],
              ),
              const Divider(),
              Row(
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
              )
            ],
          ),
        ),
      );
    }
    );
  }
}
