import 'package:africanstraw/constanst.dart';
import 'package:flutter/material.dart';
import 'package:africanstraw/widgets/route.dart';

import 'menu_type.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuTheme(
      data: PopupMenuThemeData(
        color: Colors.lightBlue[50],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.dashboard);
            },
            child: const MenuType(
              isSelected: true,
              coffeeType: "HOME",
            ),
          ),
          const SizedBox(width: 40),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.mainShop);
            },
            child: const MenuType(
              isSelected: false,
              coffeeType: "SHOP",
            ),
          ),
          const SizedBox(width: 30),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle submenu item click
              if (value == 'aboutUs') {
                Navigator.pushNamed(context, Routes.about);
              } else if (value == 'shippingProcess') {
                Navigator.pushNamed(context, Routes.shipping);
                // Navigate to Shipping Process page
              } else if (value == 'reshape') {
                Navigator.pushNamed(context, Routes.reshape);
                // Navigate to Our Team page
              } else if (value =='termsAndConditions') {
                Navigator.pushNamed(context, Routes.terms);
              } else if (value =='returnPolicy') {
                Navigator.pushNamed(context, Routes.returns);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
               const PopupMenuItem<String>(
                value: 'aboutUs',
                child: Text('About Us'),
              ),
              const PopupMenuItem<String>(
                value: 'shippingProcess',
                child: Text('Shipping Process'),
              ),
              const PopupMenuItem<String>(
                value: 'reshape',
                child: Text('Reshaping Baskets'),
              ),
              const PopupMenuItem<String>(
                value: 'termsAndConditions',
                  child: Text("Terms And Conditions")
              ),
              const PopupMenuItem<String>(
                value: 'returnPolicy',
                  child: Text('Return Policy')
              )
            ],
            child: const MenuType(
              isSelected: false,
              coffeeType: "ABOUT US",
            ),
          ),
          const SizedBox(width: 30),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.wholesale);
            },
            child: const MenuType(
              isSelected: false,
              coffeeType: "WHOLESALE",
            ),
          ),
          const SizedBox(width: 30),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.userProfile);
            },
            child: const MenuType(
              isSelected: false,
              coffeeType: "BLOG",
            ),
          ),
          const SizedBox(width: 30),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.contactPage);
            },
            child: const MenuType(
              isSelected: false,
              coffeeType: "CONTACT",
            ),
          ),
        ],
      ),
    );
  }
}
