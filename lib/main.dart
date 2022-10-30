import 'package:flutter/material.dart';
import 'package:smart_home_flutter_ui/constants/app_colors.dart';
import 'package:smart_home_flutter_ui/screen/smart_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor.bgColor,
        fontFamily: "Poppins"
      ),
      home: const SmartHomeScreen(),
    );
  }
}
