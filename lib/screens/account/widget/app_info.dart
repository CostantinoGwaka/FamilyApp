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
              "MSINGAKI's GENERATION FAMILY \n V 1.0",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),

            // const Text('Created and Managed by CosFix Solutions '),
            const SizedBox(
              height: 10,
            ),
            const Text("@MSINGAKI's generation family App 2022")
          ],
        ),
      ),
    );
  }
}
