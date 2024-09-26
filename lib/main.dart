import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:africanstraw/controller/controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:africanstraw/widgets/route.dart';
import 'firebase_options.dart';
import 'package:seo/seo.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(ChangeNotifierProvider(child: const MyApp(), create: (BuildContext context)=>Ecom()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: MaterialApp(
        title: "African Straw Basket",
        routes: pages,
        initialRoute: Routes.dashboard,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
