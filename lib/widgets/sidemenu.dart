import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:africanstraw/widgets/menu_type.dart';

Visibility sedemenu(bool show) {
  return Visibility(
    visible: show,
    child: SizedBox(height: 350,
      child: ListView(
        scrollDirection: Axis.vertical,
        children:   [
          const MenuType(
              isSelected: true,
              coffeeType: "MEAT"
          ),
          SizedBox(height: 20),
          const MenuType(
              isSelected: false,
              coffeeType: "VEGETABLES"
          ),
          Divider(thickness: 1,color: Colors.grey[200],),

          SizedBox(height: 20),
          const MenuType(
              isSelected: false,
              coffeeType: "ELECTRONICSS"
          ),
          SizedBox(height: 20),
          MenuType(
              isSelected: false,
              coffeeType: "FRUITS"
          ),
          SizedBox(height: 20),
          MenuType(
              isSelected: false,
              coffeeType: "FAST FOODS"
          ),
          SizedBox(height: 20),
          MenuType(
              isSelected: false,
              coffeeType: "BUTTER EGG"
          ),
          SizedBox(height: 20),
          MenuType(
              isSelected: false,
              coffeeType: "OCEAN FOODS"
          ),
          SizedBox(height: 20),
          MenuType(
              isSelected: false,
              coffeeType: "FRESH BERRIES"
          ),
        ],
      ),
    ),
  );
}
