import 'package:familyapp/screens/events/widget/add_event.dart';
import 'package:familyapp/screens/events/widget/event_desc.dart';
import 'package:familyapp/screens/widget/global_widget.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  var event = [];
  @override
  Widget build(BuildContext context) {
    print(event.isEmpty);
    return Scaffold(
      appBar: AppBar(title: Text('Family Event(s)')),
      body: event.isNotEmpty
          ? NoData(
              title: "EVENT(S)",
              imagepath: 'images/nodata.png',
              description: 'There is no any events posted by your family, tap Icon bottom right to add',
            )
          : ListView.builder(
              physics: physics,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  shape: shape,
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              scrollable: true,
                              shape: shape,
                              title: Center(
                                child: Text('Kikao cha harusi'),
                              ),
                              content: Column(
                                children: [
                                  // Text("Description"),
                                  manualStepper(),
                                  Text('Kikao cha kwanza cha harusi cha ninti yetu Neenmapamoja na mwenza wake John '),
                                  manualStepper(),

                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Date'),
                                          Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "23 march 2022",
                                                ),
                                                manualSpacer(),
                                                // const Icon(
                                                //   Icons.date_range,
                                                //   size: 20,
                                                // )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      manualSpacer(step: 15),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Time'),
                                          Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "10:00 PM",
                                                ),
                                                manualSpacer(),
                                                // const Icon(
                                                //   Icons.access_time,
                                                //   size: 20,
                                                // )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  manualStepper(),

                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                      ),
                                      manualSpacer(),
                                      Text('Bonyokwa - 119')
                                    ],
                                  )
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Ok"),
                                ),
                              ],
                            );
                          });
                    },
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
                        Icons.calendar_today,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    title: const Text('Kikao cha harusi '),
                    subtitle: const Text('Kikao cha kwanza cha harusi ya binti yetu Neema ...'),
                    trailing: Text('23/06/2022'),
                    // trailing: GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => EventDescription(),
                    //       ),
                    //     );
                    //   },
                    //   child: Text('Read more'),
                    // ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          CupertinoIcons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEvent(),
            ),
          );
        },
      ),
    );
  }
}
