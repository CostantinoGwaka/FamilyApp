import 'package:familyapp/screens/auth/loginscreen.dart';
import 'package:familyapp/screens/auth/register.dart';
import 'package:familyapp/screens/widget/buttons.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';

class PreAuth extends StatefulWidget {
  const PreAuth({Key key}) : super(key: key);

  @override
  State<PreAuth> createState() => _PreAuthState();
}

class _PreAuthState extends State<PreAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: deviceHeight(context) / 5,
                ),
                Image.asset(
                  'images/family.png',
                  height: deviceHeight(context) / 3,
                ),
                manualStepper(step: 20),
                const Text(
                  'Join Msingati generation Family ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      UniversalButton(
                        buttonHeight: 48,
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Registration(),
                            ),
                          );
                        },
                        elevation: 3,
                        buttonColor: Colors.white,
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                        buttonWidth: deviceWidth(context) / 1.2,
                      ),
                      manualStepper(step: 10),
                      UniversalButton(
                        buttonHeight: 48,
                        elevation: 3,
                        scale: 1,
                        size: 2,
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                        buttonColor: Theme.of(context).primaryColor,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        buttonWidth: deviceWidth(context) / 1.2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
