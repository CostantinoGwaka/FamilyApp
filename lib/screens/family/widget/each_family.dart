import 'package:familyapp/screens/family/widget/familiy_desc.dart';
import 'package:familyapp/screens/widget/bottom_sheet.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EachFamiy extends StatefulWidget {
 final String isSingle;
 final String name;
final  String location;
 final String gender;
 final String age;
 final  String job;
  EachFamiy({Key key, this.gender, this.location, this.age, this.job, this.isSingle, this.name}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    // final birthday = DateTime(1967, 10, 12);

    print(widget.isSingle.toString());
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 0.0,
              top: -20.0,
              child: Opacity(
                opacity: 0.35,
                child: Image.asset(
                  //to-do
                  "images/pattern.png",
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: kToolbarHeight,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.white,
                              size: 20,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "  Karibu Familia ya,\n",
                                      style: Theme.of(context).textTheme.headline6.copyWith(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    TextSpan(
                                      text: widget.name,
                                      style: Theme.of(context).textTheme.headline6.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/user.png"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 200.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 24.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.isSingle == 'false'
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 24.0,
                                      ),
                                      child: Text(
                                        "Taarifa za familia",
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
                                                    name: 'Constantino Gwaka',
                                                    age: '1995-12-21',
                                                    title: 'Mume',
                                                    gender: 'Me',
                                                    job: 'IT',
                                                    phone: '0712826083',
                                                  );
                                                },
                                                child: Column(
                                                  children: [
                                                    CircleAvatar(
                                                      maxRadius: 35,
                                                      backgroundImage: AssetImage('images/user.png'),
                                                    ),
                                                    Text('Baba (Hai)')
                                                  ],
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  info(
                                                    context,
                                                    name: 'Angel Swila',
                                                    age: '1998-09-12',
                                                    title: 'Mke',
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
                                                    Text('Mama' + "(Amefariki)")
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
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 24.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Taarifa za Watoto",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(19, 22, 33, 1),
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Card(
                                                shape: shape,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              'Jumla:',
                                                              style: TextStyle(fontSize: 18),
                                                            ),
                                                            manualSpacer(),
                                                            Text(
                                                              'Watoto 9',
                                                              style: TextStyle(fontSize: 18),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Text('Kiume'),
                                                                Text('5'),
                                                              ],
                                                            ),
                                                            manualSpacer(step: 10),
                                                            Container(
                                                              height: 22,
                                                              width: 2,
                                                              decoration: BoxDecoration(
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                            manualSpacer(step: 10),
                                                            Column(
                                                              children: [
                                                                Text('Kike'),
                                                                Text('4'),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment: Alignment.bottomRight,
                                                          child: TextButton(
                                                            child: Text('Ona zaidi'),
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => FamilyDescription(
                                                                          title: 'Taarifa za Watoto',
                                                                        )),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 24.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Taarifa za Wajukuu",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(19, 22, 33, 1),
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Card(
                                                shape: shape,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              'Jumla:',
                                                              style: TextStyle(fontSize: 18),
                                                            ),
                                                            manualSpacer(),
                                                            Text(
                                                              'Watoto 9',
                                                              style: TextStyle(fontSize: 18),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Text('Kiume'),
                                                                Text('5'),
                                                              ],
                                                            ),
                                                            manualSpacer(step: 10),
                                                            Container(
                                                              height: 22,
                                                              width: 2,
                                                              decoration: BoxDecoration(
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                            manualSpacer(step: 10),
                                                            Column(
                                                              children: [
                                                                Text('Kike'),
                                                                Text('4'),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment: Alignment.bottomRight,
                                                          child: TextButton(
                                                            child: Text('Ona zaidi'),
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => FamilyDescription(
                                                                          title: 'Taarifa za Wajukuu',
                                                                        )),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                                        "Taarifa Binafsi",
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
                                              leading: widget.gender == 'Ke' ? Icon(Icons.female) : Icon(Icons.male),
                                              title: Text(widget.gender),
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.work),
                                              title: Text(widget.job),
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.date_range),
                                              title: Text('Miaka ' + agedate(date: widget.age).toString()),
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
                                  "Taarifa za mawasiliano",
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
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text('0712826083'),
                                              manualSpacer(),
                                              Container(
                                                height: 10,
                                                width: 2,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              manualSpacer(),
                                              Text('0712826083'),
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.location_on),
                                          title: Text('Dar Es Salaam'),
                                          subtitle: Text('Bonyokwa - 119'),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),

                          SizedBox(height: 7.0),

                          // Container(
                          //   height: ScreenUtil().setHeight(100.0),
                          //   child: Center(
                          //     // lets make a widget for the cards
                          //     child: LocationSlider(),
                          //   ),
                          // ),
                          // LatestOrders(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
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
                    "Taarifa za " + title,
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
                    title: Text('Miaka ' + agedate(date: age).toString()),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
