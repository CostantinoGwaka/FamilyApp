import 'package:familyapp/screens/dashboard/widget/activity_desc.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';

class RecentEvents extends StatefulWidget {
  const RecentEvents({Key key}) : super(key: key);

  @override
  State<RecentEvents> createState() => _RecentEventsState();
}

class _RecentEventsState extends State<RecentEvents> {
  @override
  Widget build(BuildContext context) {
    String text = 'Kutakuwa na kikao kwaajili ya kubariki watoto wetu';
    String newtext = text.replaceRange(30, text.length, '...');
    return ListView.builder(
      physics: physics,
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return 
        ListTile(
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
          title: Text(
            newtext,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          subtitle: const Text(
            'Sunday, 23 March 2022',
            style: TextStyle(fontSize: 12),
          ),
          trailing: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActivityDescription(),
                ),
              );
            },
            child: Text('Read'),
          ),
        );
      },
    );
  }
}
