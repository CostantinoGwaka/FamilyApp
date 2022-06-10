import 'package:familyapp/core/api/request_method.dart';
import 'package:familyapp/core/api/services/data_service.dart';
import 'package:familyapp/screens/dashboard/dashboard.dart';
import 'package:familyapp/screens/events/widget/add_event.dart';
import 'package:familyapp/screens/events/widget/event_desc.dart';
import 'package:familyapp/screens/widget/global_widget.dart';
import 'package:familyapp/screens/widget/ui_helpers.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

Future events;

class _EventScreenState extends State<EventScreen> {
  Future<dynamic> getEventList() async {
    // if (events == null) {
    return postMethod(
      endpoint: "get_family_events.php",
      bodyData: {
        "family_id": DataService.userData['id'],
      },
    );
    // } else {
    //   return events;
    // }
  }

  @override
  void initState() {
    events = getEventList();
    super.initState();
  }

  var event = [];
  @override
  Widget build(BuildContext context) {
    print(DataService.userData['id']);
    return Scaffold(
      appBar: AppBar(
        title: Text('Family Event(s)'),
        // actions: [
        // Stack(
        //   children: <Widget>[
        //     Icon(Icons.notifications),
        //     Positioned(
        //       right: 0,
        //       child: Container(
        //         padding: EdgeInsets.all(1),
        //         decoration: BoxDecoration(
        //           color: Colors.red,
        //           borderRadius: BorderRadius.circular(6),
        //         ),
        //         constraints: BoxConstraints(
        //           minWidth: 12,
        //           minHeight: 12,
        //         ),
        //         child: Text(
        //           "1",
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 8,
        //           ),
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        // ],
      ),
      body: FutureBuilder(
          future: events,
          builder: (context, snapshot) {
            print('hfhhfhhfhf $snapshot');
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.data['body']['status'] == "300") {
                  return NoData(
                    title: "EVENT(S)",
                    imagepath: 'images/nodata.png',
                    description: 'There is no any events posted by your family, tap Icon bottom right to add',
                  );
                } else {
                  if (snapshot.data != "Hakuna_mtandao") {
                    if (!snapshot.hasData) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CircularProgressIndicator(),
                          UIHelper.verticalSpace(height: 10),
                          Text('Please wait...'),
                        ],
                      ));
                    }
                    return ListView.builder(
                      physics: physics,
                      itemCount: snapshot.data['body']['data'].length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data['body']['data'][index];
                        String time = DateFormat('d, MMM, yyyy').format(DateTime.tryParse(data['date_event']));

                        print('hfhhfhhfhf $data');
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
                                        child: Text(data['title']),
                                      ),
                                      content: Column(
                                        children: [
                                          // Text("Description"),
                                          manualStepper(),
                                          Text(data['descp']),
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
                                                          time,
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
                                                          data['time'],
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
                            title: Text(data['title']),
                            subtitle: Text(data['descp']),
                            // trailing: Text(DateFormat('EEEE, d MMM, yyyy').format(data['date_event'])),

                            trailing: Text(time),
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
                    );
                  } else {
                    return NoData(
                      title: "Hakuna Mtandao",
                      imagepath: 'assets/images/no_signal.png',
                      description: 'Tafadhari hakikisha una mtandao .',
                    );
                  }
                }

                break;
              default:
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      UIHelper.verticalSpace(
                        height: 5,
                      ),
                      Text('Tafadhari subiri...'),
                    ],
                  ),
                );
            }
          }),
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
