import 'package:familyapp/core/api/index.dart';
import 'package:familyapp/screens/widget/global_widget.dart';
import 'package:familyapp/screens/widget/ui_helpers.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';

class RecentEvents extends StatefulWidget {
  const RecentEvents({Key key}) : super(key: key);

  @override
  State<RecentEvents> createState() => _RecentEventsState();
}

Future recent;

class _RecentEventsState extends State<RecentEvents> {
  Future<dynamic> getEventList() async {
    if (await InternetConnectionChecker().hasConnection) {
      return postMethod(endpoint: "get_all_events.php");
    } else {
      return {
        "msg": "Mtandao Haupo",
        "body": "Hakuna_mtandao",
      };
    }
  }

  @override
  void initState() {
    getEventList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('fjjfjfj ${recent == null}');
    return FutureBuilder(
        future: getEventList(),
        builder: (context, AsyncSnapshot snapshot) {
          print('dofffff ${snapshot.data['body']}');
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.data['body'] != "Hakuna_mtandao") {
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
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    var data = snapshot.data['body']['data'][index];
                    String time = DateFormat('d, MMM, yyyy').format(DateTime.tryParse(data['date_event']));

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
                
                  title: "No Network",
                  imagepath: 'images/no_signal.png',
                  description: 'Check your network setting .',
                );
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
                    Text('Please wait...'),
                  ],
                ),
              );
          }
        });
  }
}
