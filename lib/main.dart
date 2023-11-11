import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventry_app/View/HomePage/HomeScreen.dart';

import 'View/Auth/AuthPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: InventryHome(),
    );
  }
}
