import 'dart:async';
import 'dart:convert';

import 'package:familyapp/screens/family/widget/each_family.dart';
import 'package:familyapp/screens/widget/global_widget.dart';
import 'package:familyapp/screens/widget/ui_helpers.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AllMember extends StatefulWidget {
  const AllMember({Key key}) : super(key: key);

  @override
  State<AllMember> createState() => _AllMemberState();
}

class Debouncer {
  int milliseconds;
  VoidCallback action;
  Timer timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class User {
  String name;
  String gender;
  String phone;
  String parentId;
  String status;

  String id;
  String location;
  User({
    this.gender,
    this.parentId,
    this.phone,
    this.status,
    this.name,
    this.id,
    this.location,
  });

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      name: json['fname'],
      gender: json['gender'],
      phone: json['phone'],
      parentId: json['parent_id'],
      status: json['status'],
      location: json['location'],
      id: json['id'],
    );
  }
}

Future users;

class _AllMemberState extends State<AllMember> {
  final _debouncer = Debouncer();
  String url = 'https://familyapp90.000webhostapp.com/admin/api/get_family.php';
  List<User> ulist = [];
  List<User> userLists = [];

  Future<List<User>> getAllulistList() async {
    userLists.clear();
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseDecoded = jsonDecode(response.body);
        // print("=======> ${responseDecoded['data']}");
        print(response.body);

        List<User> list = parseAgents(jsonEncode(responseDecoded['data']));
        print("=======> $list");
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future checkInternet() async {
    if (await InternetConnectionChecker().hasConnection) {
      return true;
    } else {
      return false;
    }
  }

  bool internet = true;
  static List<User> parseAgents(String responseBody) {
    print("here is response $responseBody");
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();

    checkInternet().then((value) {
      setState(() {
        internet = value;
      });
      print("here is response $value");
    });
    getAllulistList().then((userslist) {
      setState(() {
        ulist = userslist;
        userLists = ulist;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: Icon(
            Icons.groups_rounded,
            // color: Colors.black,
          ),
          title: Text(
            "Clan's Member",
            // style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
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
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  suffixIcon: const InkWell(
                    child: Icon(Icons.search),
                  ),
                  contentPadding: const EdgeInsets.all(15.0),
                  hintText: 'Search ',
                ),
                onChanged: (string) {
                  _debouncer.run(() {
                    setState(() {
                      userLists = ulist
                          .where(
                            (u) => (u.name.toLowerCase().contains(
                                  string.toLowerCase(),
                                )),
                          )
                          .toList();
                    });
                  });
                },
              ),
            ),
            Expanded(
              child: !internet
                  ? NoData(
                      title: "No Network",
                      imagepath: 'images/no_signal.png',
                      description: 'Check your network setting .',
                    )
                  : userLists.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CircularProgressIndicator(),
                              UIHelper.verticalSpace(height: 10),
                              Text('Please wait'),
                            ],
                          ),
                        )
                      : ListView.builder(
                          physics: ClampingScrollPhysics(),
                          itemCount: userLists.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(children: [
                                manualStepper(),
                                ListTile(
                                  leading: CircleAvatar(
                                    maxRadius: 35,
                                    backgroundImage: AssetImage('images/user.png'),
                                  ),
                                  title: Text(
                                    userLists[index].name,
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text('Male'),
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
                                  trailing: GestureDetector(
                                    child: Text('View more'),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EachFamiy(
                                            isSingle: 'true',
                                            name: 'John Constantino',
                                            location: 'Mbezi Beach - 1298',
                                            gender: 'Me',
                                            age: '1990-07-19',
                                            job: 'Accountant',
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                manualStepper()
                              ]),
                            );
                          },
                        ),
            )
          ],
        ));
  }
}
