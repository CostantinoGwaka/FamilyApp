// @dart=2.9
import 'dart:convert';

import 'package:familyapp/core/api/services/data_service.dart';
import 'package:familyapp/screens/widget/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:familyapp/screens/auth/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              themeMode: ThemeMode.system,
              debugShowCheckedModeBanner: false,
              home: const Splash(),
            );
          } else {
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
        });
  }
}

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode = MediaQuery.of(context).platformBrightness == Brightness.light;

    return Scaffold(
        backgroundColor: lightMode ? Theme.of(context).primaryColor : const Color(0xff042a49),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Text("Erick's ", style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 40, color: Colors.white, fontStyle: FontStyle.italic)),
                  ),
                  WidgetSpan(
                    child: Text("Family", style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 40, color: Colors.white, fontStyle: FontStyle.italic)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Let's be forever together",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontStyle: FontStyle.italic),
                ),
                UIHelper.verticalSpace(height: 8),
                Container(
                  height: 2,
                  width: 2,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                UIHelper.verticalSpace(height: 8),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        )));
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 4));
  }
}
