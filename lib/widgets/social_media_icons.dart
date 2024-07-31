import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:africanstraw/widgets/route.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, Routes.table);
          },
            child: SvgPicture.asset("assets/svg/icons8-facebook.svg", width: 20, height: 20,)
        ),
        const SizedBox(width: 18,),
        SvgPicture.asset("assets/svg/icons8-twitter.svg", width: 20, height: 20,),
        const SizedBox(width: 18,),
        GestureDetector(
          child: SvgPicture.asset("assets/svg/icons8-linkedin.svg", width: 20, height: 20,),
          onTap: (){
            Navigator.pushNamed(context, Routes.checkout);
            //signup(context);
          },
        ),
        const SizedBox(width: 18,),
        GestureDetector(
          child: SvgPicture.asset("assets/svg/icons8-pinterest.svg", width: 20, height: 20,),
          onTap: (){
            Navigator.of(context).pop();
            //signin(context);
          },
        ),
      ],
    );
  }
}