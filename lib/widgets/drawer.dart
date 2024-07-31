import 'package:flutter/material.dart';
import 'package:slidable_bar/slidable_bar.dart';
class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final SlidableBarController controller = SlidableBarController(initialStatus: true);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SafeArea(
          child: ListView(
            children: [
              DrawerHeader(child: Text("Home")),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){},
              ),

            ],
          )
      ),
    );
  }
}
