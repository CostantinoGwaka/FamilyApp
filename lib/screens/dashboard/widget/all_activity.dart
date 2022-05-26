import 'package:flutter/material.dart';

class AllActivities extends StatefulWidget {
  const AllActivities({Key key}) : super(key: key);

  @override
  State<AllActivities> createState() => _AllActivitiesState();
}

class _AllActivitiesState extends State<AllActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Activity(s)'),
      ),
    );
  }
}
