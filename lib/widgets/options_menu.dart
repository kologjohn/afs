import 'package:flutter/material.dart';
import '../controller/controller.dart';
class options_menu extends StatelessWidget {
  const options_menu({
    super.key,
    required this.showoptionmenu, required this.ecom,
  });

  final bool showoptionmenu;
  final Ecom ecom;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showoptionmenu,
      child: PopupMenuButton<String>(
        // iconColor: Colors.white,
        onSelected: (text) async{
          //print("selected");

        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem<String>(
            value: 'email',
            child: Row(children: [const Icon(Icons.email,color: Colors.green,),Text("${ecom.auth.currentUser!.email}")],),
          ),
          PopupMenuItem<String>(
            value: 'name',
            child: Row(children: [
              const Icon(Icons.person,color: Colors.green,),
              Text('${ecom.auth.currentUser!.displayName}')
            ],
            ),
          ),
          PopupMenuItem<String>(
            onTap: ()async{
              //final progress=ProgressHUD.of(context);
              //progress!.show();
              await ecom.signout();
              //Navigator.pushNamed(context, Routes.dashboard);
             // progress.dismiss();
            },
            value: 'Logout',
            child: const Row(children: [Icon(Icons.logout,color: Colors.green,),Text(' Logout')],),
          ),
        ],
      ),
    );
  }
}
