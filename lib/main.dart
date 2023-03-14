import 'package:flutter/material.dart';
import 'package:staylit/ui/screen/login_screen.dart';
import 'package:staylit/ui/screen/otp_screen.dart';
import 'package:staylit/ui/screen/profile_screen.dart';
import 'package:staylit/ui/screen/food_screen.dart';
import 'package:staylit/ui/screen/food2_screen.dart';
import 'package:staylit/ui/screen/register_screen.dart';
import 'package:staylit/ui/screen/contact_screen.dart';
import 'package:staylit/ui/screen/updatep_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactScreen(),
    );
  }
}
