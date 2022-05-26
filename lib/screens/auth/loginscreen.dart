import 'package:familyapp/screens/widget/buttons.dart';
import 'package:familyapp/screens/widget/input.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'package:familyapp/screens/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  var photos = ['images/family.png', 'images/family.png'];

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode focusEmail = new FocusNode();
  FocusNode focusPass = new FocusNode();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';

  var _timer;
  int _pos = 0;
  bool _isChecked = false;
  bool _isObscure = true;

  void _handleRememberme(bool value) {
    _isChecked = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', emailController.text);
        prefs.setString('password', passController.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var _email = _prefs.getString("email") ?? "";
    var _password = _prefs.getString("password") ?? "";
    var _remeberMe = _prefs.getBool("remember_me") ?? false;
    if (_remeberMe) {
      setState(() {
        _isChecked = true;
      });
      username = _email;
      emailController.text = _email;
      passController.text = _password;
    }
  }

  bool validateEmail(String value) {
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(value);
    return (value.isNotEmpty && emailValid) ? true : false;
  }

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 7), (Timer t) {
      setState(() {
        _pos = (_pos + 1) % widget.photos.length;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {});
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      widthFactor: 0.45,
                      child: Container(
                        child: Stack(children: [
                          AnimatedOpacity(opacity: _pos == 1 ? 1 : 0, duration: Duration(milliseconds: 1000), child: Image.asset(widget.photos[1])),
                          AnimatedOpacity(opacity: _pos == 0 ? 1 : 0, duration: Duration(milliseconds: 1000), child: Image.asset(widget.photos[0]))
                        ]),
                      ),
                    ),
                  ),
                  manualStepper(step: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Welcome Back to,',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  manualStepper(),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Erick\'s Family',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  manualStepper(step: 15),
                  Card(
                    shape: shape,
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Column(
                              children: [
                                UniversalInput(
                                  pre: '',
                                  controller: emailController,
                                  onchanged: (val) {
                                    setState(() {
                                      username = val;
                                    });
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  prefixIcon: Icons.email,
                                  sufixIcon: validateEmail(username)
                                      ? const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        )
                                      : const Icon(
                                          Icons.check_circle,
                                          color: Colors.grey,
                                        ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(
                                      color: Colors.teal,
                                      width: 1.0,
                                    ),
                                  ),
                                  hint: 'Enter your email',
                                  label: 'Email',
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                UniversalInput(
                                  pre: '',
                                  controller: passController,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(
                                      color: Colors.teal,
                                      width: 1.0,
                                    ),
                                  ),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter valid password';
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icons.lock,
                                  obscure: _isObscure,
                                  isPassword: true,
                                  sufixWidget: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                    icon: Icon(
                                      _isObscure ? Icons.visibility : Icons.visibility_off,
                                    ),
                                  ),
                                  hint: 'Enter your password',
                                  label: 'Password',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                            activeColor: Theme.of(context).primaryColor,
                                            value: _isChecked,
                                            onChanged: _handleRememberme,
                                          ),
                                          const Text(
                                            'Remember Me',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                      const Text(
                                        'Forget Password?',
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: _submitButton(),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ))),
    );
  }

  Widget _submitButton() {
    return UniversalButton(
      buttonHeight: 53,
      radius: 20,
      buttonColor: Theme.of(context).primaryColor,
      child: Text(
        'Login',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      buttonWidth: deviceWidth(context) / 1.2,
      action: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashBoard()),
        );
      },
    );
  }
}
