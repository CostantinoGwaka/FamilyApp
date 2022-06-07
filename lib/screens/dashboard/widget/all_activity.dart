import 'package:familyapp/screens/dashboard/widget/activity_desc.dart';
import 'package:familyapp/utilities/constant.dart';
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
          // iconTheme: IconTheme.of(context).copyWith(
          //   color: Colors.black,
          // ),
          elevation: 0,
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'All Event(s)',
            // style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: ListView.builder(
          physics: physics,
          scrollDirection: Axis.vertical,
          itemCount: 15,
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
              title: const Text('One member added hdh dhdhd dhhd '),
              subtitle: const Text('Sunday, 23 March 2022'),
              trailing: GestureDetector(
                onTap: () {
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
        ));
  }
}
