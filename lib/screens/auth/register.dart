import 'dart:async';
import 'dart:convert';

import 'package:familyapp/screens/widget/bottom_sheet.dart';
import 'package:familyapp/screens/widget/buttons.dart';
import 'package:familyapp/screens/widget/input.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  Registration({Key key}) : super(key: key);
  final photos = ['images/family.png', 'images/family.png'];

  @override
  State<Registration> createState() => _RegistrationState();
}

class Subject {
  String name;
  String id;
  String location;
  Subject({
    this.name,
    this.id,
    this.location,
  });

  factory Subject.fromJson(Map<dynamic, dynamic> json) {
    return Subject(
      name: json['name'],
      location: json['location'],
      id: json['id'],
    );
  }
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

class _RegistrationState extends State<Registration> {
  final _debouncer = Debouncer();

  List<Subject> ulist = [];
  List<Subject> userLists = [];
  int _pos = 0;
  bool _isObscure = true;
  String url = 'https://type.fit/api/quotes';
  String url2 = 'https://randomuser.me/api/';
  String title = 'Mfano. Cosmas';
  List listUser = [
    {
      'name': "Juma Ally Nhelegan",
      'location': "Mbezi",
      "id": "1",
    },
    {
      'name': "Cosmas Paulo Nhelegan",
      'location': "Kimara",
      "id": "2",
    },
    {
      'name': "Alex Paulo Nhelegan",
      'location': "Bweni",
      "id": "3",
    },
    {
      'name': "Lucy Juma Nhelegan",
      'location': "Kimara",
      "id": "4",
    },
  ];

  int parentId = 0;
  Future<List<Subject>> getAllulistList() async {
    userLists.clear();
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        List<Subject> list = parseAgents(jsonEncode(listUser));
        print("=======> $list");
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Subject> parseAgents(String responseBody) {
    print("here is response $responseBody");
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Subject>((json) => Subject.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   // ulist = listUser;
    //   userLists = ulist;
    // });
    getAllulistList().then((subjectFromServer) {
      setState(() {
        ulist = subjectFromServer;
        userLists = ulist;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      widthFactor: 0.45,
                      child: Container(
                        child: Stack(children: [
                          AnimatedOpacity(
                              opacity: _pos == 1 ? 1 : 0,
                              duration: Duration(milliseconds: 1000),
                              child: Image.asset(
                                widget.photos[1],
                              )),
                          AnimatedOpacity(
                              opacity: _pos == 0 ? 1 : 0,
                              duration: Duration(milliseconds: 1000),
                              child: Image.asset(
                                widget.photos[0],
                              ))
                        ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Register account',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return StatefulBuilder(builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
                                    return SizedBox(
                                      height: deviceHeight(context) / 1.2,
                                      child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            physics: const ClampingScrollPhysics(),
                                            padding: const EdgeInsets.all(5),
                                            itemCount: userLists.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    title = userLists[index].name;
                                                    parentId = int.parse(userLists[index].id);
                                                  });
                                                },
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20),
                                                    side: BorderSide(
                                                      color: Colors.grey.shade300,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        ListTile(
                                                          title: Text(
                                                            userLists[index].name,
                                                            style: const TextStyle(fontSize: 16),
                                                          ),
                                                          subtitle: Text(
                                                            userLists[index].location,
                                                            style: const TextStyle(fontSize: 16),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ]),
                                    );
                                  });
                                });
                          },
                          child: AbsorbPointer(
                            child: UniversalInput(
                              prefixIcon: Icons.family_restroom,
                              hint: title,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:  BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.0,
                                ),
                              ),
                              label: "Parent name",
                            ),
                          ),
                        ),
                        manualStepper(step: 15),
                        UniversalInput(
                          prefixIcon: Icons.person,
                          hint: "First name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:  BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0,
                            ),
                          ),
                          label: "first name",
                        ),
                        manualStepper(step: 15),
                        UniversalInput(
                          prefixIcon: Icons.qr_code,
                          hint: "Code",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:  BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0,
                            ),
                          ),
                          label: "Joining Code",
                        ),
                        manualStepper(step: 15),
                        UniversalInput(
                          pre: '',
                          // controller: passController,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:  BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0,
                            ),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter valid password';
                            }
                            return null;
                          },
                          prefixIcon: Icons.lock,
                          obscure: _isObscure,
                          isPassword: true,
                          sufixWidget: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off,
                            ),
                          ),
                          hint: 'Enter your password',
                          label: 'Password',
                        ),
                      ],
                    ),
                  ),
                  manualStepper(step: 15),
                  UniversalButton(
                    action: () {},
                    buttonHeight: 53,
                    radius: 20,
                    buttonColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    buttonWidth: deviceWidth(context) / 1.2,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
