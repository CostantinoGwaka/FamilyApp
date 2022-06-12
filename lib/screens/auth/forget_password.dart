import 'package:familyapp/core/api/request_method.dart';
import 'package:familyapp/screens/widget/buttons.dart';
import 'package:familyapp/screens/widget/global_widget.dart';
import 'package:familyapp/screens/widget/input.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var newpassController = TextEditingController();
  bool _isObscure = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Password')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              children: [
                manualStepper(step: 15),
                UniversalInput(
                  controller: emailController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ),
                  ),
                  hint: 'Enter your phone number',
                  label: 'Phone number',
                ),
                manualStepper(step: 15),
                UniversalInput(
                  pre: '',
                  controller: passController,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter old password';
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
                  hint: 'Enter your old password',
                  label: 'Old Password',
                ),
                manualStepper(step: 15),
                UniversalInput(
                  pre: '',
                  controller: newpassController,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter new password';
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
                  hint: 'Enter your new password',
                  label: 'New Password',
                ),
                manualStepper(step: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _submitButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return UniversalButton(
      buttonHeight: 53,
      radius: 20,
      buttonColor: Theme.of(context).primaryColor,
      child: Text(
        'Change Password',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      buttonWidth: deviceWidth(context) / 1.2,
      action: () async {
        if (_formKey.currentState.validate()) {
          universalLoading(context, content: 'Please wait...');
          var _data = {
            "phone": emailController.text,
            "oldpassword": passController.text,
            "newpassword": newpassController.text,
          };

          postMethod(
            endpoint: "change_password.php",
            bodyData: _data,
          ).then((value) async {
            print(" here we are $value");
            if (value == "Connection closed before full header was received") {
              Navigator.pop(context);
              respondMessage(
                context,
                isSuccess: false,
                color: Theme.of(context).primaryColor,
                title: "Something wrong",
                subTitle: "please try angain",
              );
            } else {
              if (value['body']['status'] == "200") {
         
                Navigator.pop(context);
                respondMessage(
                  context,
                  isSuccess: true,
                  color: Theme.of(context).primaryColor,
                  title: "Successfull",
                  subTitle: "Password change successfull",
                );
                Navigator.pop(
                  context,
                );
              } else {
                passController.clear();
                emailController.clear();
                Navigator.pop(context);
                respondMessage(
                  context,
                  isSuccess: false,
                  color: Theme.of(context).primaryColor,
                  title: "Unsuccessully",
                  subTitle: "Please try again",
                );
              }
            }
          });
        }
      },
    );
  }
}
