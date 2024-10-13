import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:africanstraw/widgets/route.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcons extends StatefulWidget {
  const SocialMediaIcons({
    super.key,
  });

  @override
  State<SocialMediaIcons> createState() => _SocialMediaIconsState();
}

class _SocialMediaIconsState extends State<SocialMediaIcons> {
  // Function to open a URL
  Future<void> openSocialMedia(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication); // Opens the link in the web browser or app
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Tooltip(
          message: "Click  here to connect to our Facebook Page",
          child: InkWell(
            onTap: ()async{
              openSocialMedia("https://web.facebook.com/profile.php?id=61564222613948");
              //Navigator.pushNamed(context, "https://web.facebook.com/profile.php?id=61564222613948");
            },
              child: SvgPicture.asset("assets/svg/icons8-facebook.svg", width: 20, height: 20,)
          ),
        ),
        const SizedBox(width: 18,),
        Tooltip(
          message: "Click  here to connect to our Instagram Page",
          child: InkWell(onTap:(){
            openSocialMedia("https://www.instagram.com/asebaskets/");
          },child: SvgPicture.asset("assets/svg/instagram.svg", width: 20, height: 20,)),
        ),
        const SizedBox(width: 18,),
        Tooltip(
          message: "Click  here to connect to our Twitter Page",
          child: InkWell(
            child: SvgPicture.asset("assets/svg/twitter.svg", width: 20, height: 20,),
            onTap: (){
              openSocialMedia("https://x.com/asebaskets");
              //signup(context);
            },
          ),
        ),
        const SizedBox(width: 18,),
        Tooltip(
          message: "Click here to chat with us on WhatsApp",
          child: InkWell(
            child: SvgPicture.asset("assets/svg/whatsapp.svg", width: 20, height: 20,),
            onTap: (){
              openSocialMedia('https://wa.me/233546768837');

              //signin(context);
            },
          ),
        ),
        const SizedBox(width: 18,),

        InkWell(
          
          child: Tooltip(message:"Fair Trade Certified",child: SvgPicture.asset("assets/svg/fairtrade.svg", width: 20, height: 20,)),
          onTap: (){
            openSocialMedia("https://www.fairforlife.org/pmws/indexDOM.php?client_id=fairforlife&page_id=certified&lang_iso639=en&company_id=1902");
            //signin(context);
          },
        ),
      ],
    );
  }
}