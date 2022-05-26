import 'package:flutter/material.dart';

class ActivityDescription extends StatefulWidget {
  const ActivityDescription({Key key}) : super(key: key);

  @override
  State<ActivityDescription> createState() => _ActivityDescriptionState();
}

class _ActivityDescriptionState extends State<ActivityDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mtoto ameongezwa')),
    );
  }
}
