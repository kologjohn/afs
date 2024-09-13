import 'package:flutter/material.dart';
import '../components/global.dart';

class BannerPost extends StatelessWidget {

  final String title;
  final String subTitle;
  final String imageUrl;
  final Color? conColor;

  const BannerPost({
    super.key, required this.title, required this.subTitle, required this.imageUrl, required this.conColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          height: 300,
          color: conColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset(imageUrl, height: 300, width: 300,)
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Global.mainColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20
                          ),
                        ),
                        //const SizedBox(height: 8),
                        Text(
                          subTitle,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20
                          ),
                        ),
                        //const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Global.mainColor.withOpacity(0.5);
                              }
                              return Global.mainColor;
                            }),
                          ),
                          child: const Text("SHOP NOW", style: TextStyle(color: Colors.white, fontSize: 8),),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}