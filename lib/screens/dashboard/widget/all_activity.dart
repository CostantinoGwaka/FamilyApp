import 'package:familyapp/core/api/request_method.dart';
import 'package:familyapp/screens/dashboard/widget/activity_desc.dart';
import 'package:familyapp/screens/widget/global_widget.dart';
import 'package:familyapp/screens/widget/ui_helpers.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';

class AllActivities extends StatefulWidget {
  const AllActivities({Key key}) : super(key: key);

  @override
  State<AllActivities> createState() => _AllActivitiesState();
}

Future recent;

class _AllActivitiesState extends State<AllActivities> {
  Future<dynamic> getEventList() async {
    if (recent == null) {
      return postMethod(endpoint: "get_all_events.php");
    } else {
      return recent;
    }
  }

  @override
  void initState() {
    recent = getEventList();
    super.initState();
  }

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
        body: FutureBuilder(
            future: recent,
            builder: (context, AsyncSnapshot snapshot) {
              print(' here  data ${snapshot.data}');
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.data != "Hakuna_mtandao") {
                    if (!snapshot.hasData) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CircularProgressIndicator(),
                          UIHelper.verticalSpace(height: 10),
                          Text('Inapakua Tafadhari subiri'),
                        ],
                      ));
                    }
                    return ListView.builder(
                      physics: physics,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data['body']['data'].length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data['body']['data'][index];
                        print("hahahhah $data");
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
                                                          data['date_event'],
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
                            trailing: Text(data['date_event']),
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
            }));
  }
}
