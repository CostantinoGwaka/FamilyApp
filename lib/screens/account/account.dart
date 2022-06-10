import 'package:familyapp/core/api/services/data_service.dart';
import 'package:familyapp/screens/account/widget/app_info.dart';
import 'package:familyapp/screens/auth/forget_password.dart';
import 'package:familyapp/screens/auth/loginscreen.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Account'),
        centerTitle: true,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          manualStepper(step: 20),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 35,
                  backgroundImage: AssetImage('images/user.png'),
                ),
                manualStepper(),
                Text(DataService.userData['fullname']),
                manualStepper(step: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 45,
                      child: Column(
                        children: [
                          Text('Age'),
                          Text('31'),
                        ],
                      ),
                    ),
                    manualSpacer(),
                    Container(
                      height: 25,
                      width: 2,
                      color: Colors.black,
                    ),
                    manualSpacer(),
                    SizedBox(
                      width: 45,
                      child: Column(
                        children: [
                          Text('Gender'),
                          Text(DataService.userData['gender']),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          manualStepper(
            step: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Card(
                  shape: shape,
                  elevation: 0,
                  child: ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    title: Text('My Account'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: shape,
                  elevation: 0,
                  child: ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    title: Text('Change password'),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPassword(),
                            ));
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: shape,
                  elevation: 0,
                  child: ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    title: Text('App Info'),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppInfo(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Icon(
                        Icons.exit_to_app,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                    title: const Text(
                      'Log out',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomLeft,
                //   child: Card(
                //     child: ListTile(
                //       leading: Container(
                //         height: 30,
                //         width: 30,
                //         decoration: BoxDecoration(
                //           color: Colors.red.withOpacity(0.2),
                //           borderRadius: const BorderRadius.all(
                //             Radius.circular(10),
                //           ),
                //         ),
                //         child: const Icon(
                //           Icons.exit_to_app,
                //           size: 20,
                //           color: Colors.red,
                //         ),
                //       ),
                //       title: const Text(
                //         'Log out',
                //         style: TextStyle(
                //           color: Colors.red,
                //         ),
                //       ),
                //       onTap: () {},
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Card(
      //     child: ListTile(
      //       leading: Container(
      //         height: 30,
      //         width: 30,
      //         decoration: BoxDecoration(
      //           color: Colors.red.withOpacity(0.2),
      //           borderRadius: const BorderRadius.all(
      //             Radius.circular(10),
      //           ),
      //         ),
      //         child: const Icon(
      //           Icons.exit_to_app,
      //           size: 20,
      //           color: Colors.red,
      //         ),
      //       ),
      //       title: const Text(
      //         'Log out',
      //         style: TextStyle(
      //           color: Colors.red,
      //         ),
      //       ),
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => Login(),
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
