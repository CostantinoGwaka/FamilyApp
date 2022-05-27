import 'package:familyapp/screens/dashboard/widget/activity_desc.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';

class RecentActivities extends StatefulWidget {
  const RecentActivities({Key key}) : super(key: key);

  @override
  State<RecentActivities> createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {
  @override
  Widget build(BuildContext context) {
    return 
    ListView.builder(
      physics: physics,
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
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
              Icons.access_time_filled_sharp,
              color: Theme.of(context).primaryColor,
            ),
          ),
          title: const Text('One member added'),
          subtitle: const Text('Sunday, 23 March 2022'),
          trailing: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActivityDescription(),
                ),
              );
            },
            child: Text('Read more'),
          ),
        );
      },
    );
  }
}