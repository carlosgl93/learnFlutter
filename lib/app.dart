import 'package:flutter/material.dart';
import 'homepage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final yellow = const Color(0xffe9c46a); // font color
  final orange = const Color(0xfff4a261); // CTA color
  final red = const Color(0xffe76f51); // background color

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Learn Flutter'),
    );
  }
}
