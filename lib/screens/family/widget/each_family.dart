import 'package:familyapp/core/api/request_method.dart';
import 'package:familyapp/core/api/services/data_service.dart';
import 'package:familyapp/screens/family/widget/familiy_desc.dart';
import 'package:familyapp/screens/widget/bottom_sheet.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class EachFamiy extends StatefulWidget {
  final String isSingle;
  final String name;
  final String id;
  final String phone;
  final String parentId;
  final String location;
  final String gender;
  final String age;
  final String job;
  EachFamiy({Key key, this.id, this.parentId, this.phone, this.gender, this.location, this.age, this.job, this.isSingle, this.name}) : super(key: key);

  @override
  State<EachFamiy> createState() => _EachFamiyState();
}

class _EachFamiyState extends State<EachFamiy> {
  int agedate({String date}) {
    String datesss = date;
    DateTime dates = DateTime.parse(datesss);

    final date2 = DateTime.now();
    final difference = date2.difference(dates).inDays / 365;

    return difference.floor();
  }

  Future<dynamic> getFamilyList() async {
    DataService.familyList.clear();
    return postMethod(
      endpoint: "get_family_children.php",
      bodyData: {
        "member_id": widget.id,
      },
    );
  }

  @override
  void initState() {
    getFamilyList().then((value) async {
      if (await InternetConnectionChecker().hasConnection) {
        if (value['body']['status'] == "200") {
          setState(() {
            DataService.familyList = value['body']['data'];
          });
        } else {
          print('mimi na wewe ee $value');
          setState(() {
            DataService.familyList = [];
          });
        }
      } else {
        return {
          "msg": "Mtandao Haupo",
          "body": "Hakuna_mtandao",
        };
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final birthday = DateTime(1967, 10, 12);

    print(widget.isSingle.toString());
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          elevation: 0,
          pinned: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
          expandedHeight: deviceHeight(context) / 3,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            collapseMode: CollapseMode.parallax,
            title: Text(widget.name),
            background: Hero(
              tag: 'assets/images/image.jpg',
              child: Image.asset(
                'images/pattern.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: deviceHeight(context) / 25,
              ),
              DataService.familyList.isNotEmpty
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.0,
                          ),
                          child: Text(
                            "Family's Information",
                            style: TextStyle(
                              color: Color.fromRGBO(19, 22, 33, 1),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 25, top: 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      info(
                                        context,
                                        name: DataService.userData['fullname'],
                                        age: '1995-12-21',
                                        title: 'Father',
                                        gender: DataService.userData['gender'],
                                        job: 'IT',
                                        phone: DataService.userData['phone'],
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          maxRadius: 35,
                                          backgroundImage: AssetImage('images/user.png'),
                                        ),
                                        manualStepper(),
                                        DataService.userData['gender'] == "Male" ? Text('Father') : Text('Father')
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      info(
                                        context,
                                        name: 'Angel Swila',
                                        age: '1998-09-12',
                                        title: 'Mother',
                                        gender: 'Ke',
                                        job: "Mfanyabiashara",
                                        phone: '0678978678',
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          maxRadius: 35,
                                          backgroundImage: AssetImage('images/user.png'),
                                        ),
                                        manualStepper(),
                                        Text('Mother')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                            ],
                          ),
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: deviceHeight(context) / 25,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                manualStepper(),
                                ExpansionTile(
                                  title: Text(
                                    "Children's Information",
                                    style: TextStyle(
                                      color: Color.fromRGBO(19, 22, 33, 1),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  children: [
                                    for (var item in DataService.familyList)
                                      Card(
                                        child: Column(children: [
                                          manualStepper(),
                                          ListTile(
                                            leading: CircleAvatar(
                                              maxRadius: 35,
                                              backgroundImage: AssetImage('images/user.png'),
                                            ),
                                            title: Text(item['fname']),
                                            subtitle: Row(
                                              children: [
                                                Text(item['gender']),
                                                manualSpacer(),
                                                Container(
                                                  height: 10,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                manualSpacer(),
                                                Text("17 year(s)"),
                                              ],
                                            ),
                                          ),
                                          manualStepper()
                                        ]),
                                      )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //   Padding(
                          //     padding: EdgeInsets.symmetric(
                          //       horizontal: 24.0,
                          //     ),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           "Gland children's Informations",
                          //           style: TextStyle(
                          //             color: Color.fromRGBO(19, 22, 33, 1),
                          //             fontSize: 18.0,
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //         Card(
                          //           shape: shape,
                          //           child: SizedBox(
                          //             width: double.infinity,
                          //             child: Padding(
                          //               padding: const EdgeInsets.all(8.0),
                          //               child: Column(
                          //                 crossAxisAlignment: CrossAxisAlignment.center,
                          //                 children: [
                          //                   Row(
                          //                     mainAxisAlignment: MainAxisAlignment.center,
                          //                     children: [
                          //                       Text(
                          //                         'Total:',
                          //                         style: TextStyle(fontSize: 18),
                          //                       ),
                          //                       manualSpacer(),
                          //                       Text(
                          //                         '9',
                          //                         style: TextStyle(fontSize: 18),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                   Row(
                          //                     mainAxisAlignment: MainAxisAlignment.center,
                          //                     children: [
                          //                       Column(
                          //                         children: [
                          //                           Text('Male'),
                          //                           Text('5'),
                          //                         ],
                          //                       ),
                          //                       manualSpacer(step: 10),
                          //                       Container(
                          //                         height: 22,
                          //                         width: 2,
                          //                         decoration: BoxDecoration(
                          //                           color: Colors.black,
                          //                         ),
                          //                       ),
                          //                       manualSpacer(step: 10),
                          //                       Column(
                          //                         children: [
                          //                           Text('Female'),
                          //                           Text('4'),
                          //                         ],
                          //                       ),
                          //                     ],
                          //                   ),
                          //                   Align(
                          //                     alignment: Alignment.bottomRight,
                          //                     child: GestureDetector(
                          //                       child: Text('View more'),
                          //                       onTap: () {
                          //                         // Navigator.push(
                          //                         //   context,
                          //                         //   MaterialPageRoute(
                          //                         //       builder: (context) => FamilyDescription(
                          //                         //             title: "Gland children Information",
                          //                         //           )),
                          //                         // );
                          //                       },
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ],
                        ]),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.0,
                          ),
                          child: Text(
                            "Personal Information",
                            style: TextStyle(
                              color: Color.fromRGBO(19, 22, 33, 1),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Card(
                          shape: shape,
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                ListTile(
                                  leading: "Male" == widget.gender ? Icon(Icons.female) : Icon(Icons.male),
                                  title: Text(widget.gender),
                                ),
                                ListTile(
                                  leading: Icon(Icons.work),
                                  title: Text("Mfanyabiashara"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.date_range),
                                  title: Text(agedate(date: "1990-07-20").toString() + ' Years '),
                                ),
                              ]),
                            ),
                          ),
                        )
                      ],
                    ),
              // Divider(
              //   height: 2,
              // ),

              SizedBox(
                height: 7,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact Informations",
                      style: TextStyle(
                        color: Color.fromRGBO(19, 22, 33, 1),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 7.0),
                    SizedBox(
                        // height: 100,
                        width: double.infinity,
                        child: Column(
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Icon(Icons.phone_sharp),
                            //     Row(
                            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         Text('0712826083'),
                            //         manualSpacer(),
                            //         Container(
                            //           height: 10,
                            //           width: 2,
                            //           decoration: BoxDecoration(
                            //             color: Colors.black,
                            //           ),
                            //         ),
                            //         manualSpacer(),
                            //         Text('0712826083'),
                            //       ],
                            //     )
                            //   ],
                            // ),
                            ListTile(
                              leading: Icon(Icons.phone),
                              title: Row(
                                children: [
                                  Text(widget.phone),
                                  // manualSpacer(),
                                  // Container(
                                  //   height: 10,
                                  //   width: 2,
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.black,
                                  //   ),
                                  // ),
                                  // manualSpacer(),
                                  // Text('0712826083'),
                                ],
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.location_on),
                              // title: Text('Dar Es Salaam'),
                              title: Text(widget.location),
                            ),
                            manualStepper(step: 70)
                          ],
                        ))
                  ],
                ),
              ),

              SizedBox(height: 58.0),

              // LatestOrders(),
            ],
          ),
        ]))
      ]),
    );
  }

  void info(BuildContext context, {String name, phone, job, gender, age, title}) {
    return universalBottomSheet(context,
        scrollable: true,
        child: SizedBox(
          height: deviceHeight(context) / 2,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Column(
                children: [
                  manualStepper(step: 10),
                  Text(
                    title + "'s " + "Information",
                    style: TextStyle(
                      color: Color.fromRGBO(19, 22, 33, 1),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(),
                  manualStepper(),
                  CircleAvatar(
                    maxRadius: 35,
                    backgroundImage: AssetImage('images/user.png'),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(name),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('255712826083'),
                    // subtitle: Text(phone),
                  ),
                  ListTile(
                    leading: gender == 'Ke' ? Icon(Icons.female) : Icon(Icons.male),
                    title: Text(gender),
                  ),
                  ListTile(
                    leading: Icon(Icons.work),
                    title: Text(job),
                  ),
                  ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text(agedate(date: age).toString() + ' Years'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
