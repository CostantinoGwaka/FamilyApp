// @dart=2.9
import 'dart:convert';

import 'package:familyapp/core/api/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:familyapp/screens/auth/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future _retriveUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.getString('userdata');
  }

  @override
  void initState() {
    _retriveUserData().then((value) {
      if (value != null) {
        Map<String, dynamic> decodedMap = json.decode(value);
        setState(() {
          DataService.userData = decodedMap;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Family App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Login(),
    );
  }
}
