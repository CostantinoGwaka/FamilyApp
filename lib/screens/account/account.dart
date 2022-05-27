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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 35,
                  backgroundImage: AssetImage('images/user.png'),
                ),
                manualStepper(),
                Text('Erick Erick'),
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
                          Text('Male'),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
