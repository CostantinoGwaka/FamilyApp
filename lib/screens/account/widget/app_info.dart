import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/family.png',
              height: 120,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Erick's Family V 1.0",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),

            // const Text('Created and Managed by CosFix Solutions '),
            const SizedBox(
              height: 10,
            ),
            const Text("@Erick's Family App 2022")
          ],
        ),
      ),
    );
  }
}
