import 'package:familyapp/core/api/index.dart';
import 'package:familyapp/core/api/services/data_service.dart';
import 'package:familyapp/screens/account/account.dart';
import 'package:familyapp/screens/dashboard/widget/all_activity.dart';
import 'package:familyapp/screens/dashboard/widget/recent_activities.dart';
import 'package:familyapp/screens/events/events.dart';
import 'package:familyapp/screens/family/my_family.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashBoard extends StatefulWidget {
  @override
  DashboardScreen createState() => DashboardScreen();
}

List events = [];

class DashboardScreen extends State<DashBoard> {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  Future<dynamic> getEventList() async {
    return postMethod(
      endpoint: "get_family_events.php",
      bodyData: {
        "family_id": DataService.userData['id'],
      },
    );
  }

  Future<dynamic> getFamilyList() async {
    return postMethod(
      endpoint: "get_family_children.php",
      bodyData: {
        "member_id": DataService.userData['id'],
      },
    );
  }

  @override
  void initState() {
    getFamilyList().then((value) {
      setState(() {
        DataService.myFamilyList = value['body']['data'];
      });
    });
    getEventList().then((value) {
      print(" vlaueeeee $value");
      setState(() {
        DataService.eventsList = value['body']['data'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("here events ${DataService.myFamilyList}");
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: Icon(
            Icons.home,
            // color: Colors.black,
          ),
          title: Text(
            "Misingati\'s Generation",
            // style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Account(),
                    ),
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "images/user.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Material(
              child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 5,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            manualStepper(),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Hi, " + DataService.userData['fullname'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    greeting(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Quick Links",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => AllFamily(),
                    //       ),
                    //     );
                    //   },
                    //   child: Row(
                    //     children: [
                    //       Text('View all'),
                    //       manualSpacer(),
                    //       Icon(
                    //         Icons.arrow_forward_ios,
                    //         size: 12,
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  18,
                  0,
                  18,
                  0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyFamiliy(),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                          child: SizedBox(
                            height: 70,
                            width: deviceWidth(context) / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Text(
                                      "My Family",
                                    ),
                                    manualSpacer(),
                                    Text(
                                      DataService.myFamilyList.length.toString() + " Member",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    Icons.group,
                                    size: 30,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventScreen(),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                          child: SizedBox(
                            height: 70,
                            width: deviceWidth(context) / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Text(
                                      "Events",
                                    ),
                                    manualSpacer(),
                                    Text(
                                      DataService.eventsList.length.toString() + " Event(s)",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    Icons.calendar_today_outlined,
                                    size: 30,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // RecentFamilies(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Recent Events",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecentEvents(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text('View all'),
                          manualSpacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(child: RecentEvents())
            ],
          )),
        ),
      ),
    );
  }
}
