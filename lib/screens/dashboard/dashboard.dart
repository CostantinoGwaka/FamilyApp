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

class DashboardScreen extends State<DashBoard> {
  List<String> images1 = [
    "https://st4.depositphotos.com/1643295/24751/i/600/depositphotos_247513910-stock-photo-portrait-serious-mature-indian-businessman.jpg",
    "https://www.mckinsey.com/~/media/mckinsey/locations/asia/india/careers/our%20people/raman/india_careers_raman-sharma_quote-profile_1536x1152.jpg?mw=1536&car=48:59&cpx=Left&cpy=Top"
        "https://us.123rf.com/450wm/michaeljung/michaeljung1209/michaeljung120900015/15041949-attractive-female-white-collar-worker-in-office.jpg?ver=6",
    "https://www.manchester.ac.uk/study/international/country-specific-information/india/India-profile-video-pic-070519-edited.jpg"
  ];
  List<String> images2 = [
    "https://www.mckinsey.com/~/media/mckinsey/locations/asia/india/careers/our%20people/raman/india_careers_raman-sharma_quote-profile_1536x1152.jpg?mw=1536&car=48:59&cpx=Left&cpy=Top",
    "https://us.123rf.com/450wm/michaeljung/michaeljung1209/michaeljung120900015/15041949-attractive-female-white-collar-worker-in-office.jpg?ver=6",
    "https://www.manchester.ac.uk/study/international/country-specific-information/india/India-profile-video-pic-070519-edited.jpg"
  ];
  List<String> images3 = [
    "https://images.unsplash.com/photo-1534235187448-833893dfe3e0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80",
    "https://us.123rf.com/450wm/michaeljung/michaeljung1209/michaeljung120900015/15041949-attractive-female-white-collar-worker-in-office.jpg?ver=6",
    "https://images.pexels.com/photos/4593618/pexels-photo-4593618.jpeg?cs=srgb&dl=pexels-nila-racigan-4593618.jpg&fm=jpg",
  ];
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

  @override
  Widget build(BuildContext context) {
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
                                      "2 Member",
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
                                      "2 Event(s)",
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
                            builder: (context) => AllActivities(),
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
