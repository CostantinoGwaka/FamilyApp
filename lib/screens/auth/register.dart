import 'dart:async';
import 'dart:convert';

import 'package:familyapp/core/api/index.dart';
import 'package:familyapp/screens/auth/loginscreen.dart';
import 'package:familyapp/screens/widget/bottom_sheet.dart';
import 'package:familyapp/screens/widget/buttons.dart';
import 'package:familyapp/screens/widget/global_widget.dart';
import 'package:familyapp/screens/widget/input.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Registration extends StatefulWidget {
  Registration({Key key}) : super(key: key);
  final photos = ['images/family.png', 'images/family.png'];

  @override
  State<Registration> createState() => _RegistrationState();
}

class User {
  String name;
  String id;
  String location;
  User({
    this.name,
    this.id,
    this.location,
  });

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      name: json['fname'],
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
  var _phoneController = TextEditingController();
  var _nameController = TextEditingController();
  var _passController = TextEditingController();
  var _codeController = TextEditingController();
  var _locationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _debouncer = Debouncer();

  List<User> ulist = [];
  List<User> userLists = [];
  int _pos = 0;
  bool _isObscure = true;
  String url = 'https://familyapp90.000webhostapp.com/admin/api/get_family.php';
  String url2 = 'https://randomuser.me/api/';
  String title = 'Mfano. Cosmas Paulo Ngowi';
  String dropdownValue = '';

  int parentId = 0;
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

  static List<User> parseAgents(String responseBody) {
    print("here is response $responseBody");
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(1960, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllulistList().then((UserFromServer) {
      setState(() {
        ulist = UserFromServer;
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: FractionallySizedBox(
                        alignment: Alignment.topCenter,
                        widthFactor: 0.3,
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
                                    return StatefulBuilder(builder: (BuildContext context, setState /*You can rename this!*/) {
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
                                                    return StatefulBuilder(
                                                      builder: (BuildContext context, setState) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              title = userLists[index].name;
                                                              parentId = int.parse(userLists[index].id);
                                                            });
                                                            Navigator.pop(context);
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
                                                    );
                                                  })),
                                        ]),
                                      );
                                    });
                                  });
                            },
                            child: AbsorbPointer(
                              child: UniversalInput(
                                padding: EdgeInsets.all(0),
                                prefixIcon: Icons.family_restroom,
                                hint: title,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.0,
                                  ),
                                ),
                                label: "Parent name",
                              ),
                            ),
                          ),
                          manualStepper(step: 10),
                          UniversalInput(
                            controller: _nameController,
                            padding: EdgeInsets.all(0),
                            prefixIcon: Icons.person,
                            hint: "Full name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.0,
                              ),
                            ),
                            label: "Full name",
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter full name';
                              }
                              return null;
                            },
                          ),
                          manualStepper(step: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonFormField<String>(
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please select gender';
                                }
                                return null;
                              },
                              hint: Text('eg. Male'),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.male),
                                label: Text('Gender'),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.0,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.0,
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(8),
                              ),
                              // value: dropdownValue,
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'Male',
                                'Female',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Date of birth'),
                                      Container(
                                        height: 50,
                                        width: deviceWidth(context) / 1.3,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Theme.of(context).primaryColor, // red as border color
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                DateFormat('EEEE, d MMM, yyyy').format(selectedDate),
                                              ),
                                              manualSpacer(),
                                              const Icon(
                                                Icons.date_range,
                                                size: 20,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                manualSpacer(step: 15),
                              ],
                            ),
                          ),
                          manualStepper(step: 10),
                          UniversalInput(
                            keyboardType: TextInputType.phone,
                            controller: _phoneController,
                            padding: EdgeInsets.all(0),
                            prefixIcon: Icons.phone,
                            hint: "eg 0712826083",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.0,
                              ),
                            ),
                            label: "Phone number",
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please phone number';
                              }
                              return null;
                            },
                          ),
                          manualStepper(step: 10),
                          UniversalInput(
                            controller: _locationController,
                            padding: EdgeInsets.all(0),
                            prefixIcon: Icons.location_on_outlined,
                            hint: "eg Bonyokwa - 18",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.0,
                              ),
                            ),
                            label: "Location",
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter location';
                              }
                              return null;
                            },
                          ),
                          manualStepper(step: 10),
                          UniversalInput(
                            controller: _codeController,
                            padding: EdgeInsets.all(0),
                            prefixIcon: Icons.qr_code,
                            hint: "Code",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.0,
                              ),
                            ),
                            label: "Joining Code",
                          ),
                          manualStepper(step: 10),
                          UniversalInput(
                            controller: _passController,
                            padding: EdgeInsets.all(0),
                            pre: '',
                            // controller: passController,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
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
                    manualStepper(step: 10),
                    UniversalButton(
                      action: () {
                        if (_formKey.currentState.validate()) {
                          universalLoading(context, content: 'Please wait...');

                          var _data = {
                            "fname": _nameController.text,
                            "gender": dropdownValue,
                            "phone": _phoneController.text,
                            "location": _locationController.text,
                            "parent_id": parentId.toString(),
                            "code": _codeController.text,
                            "password": _passController.text,
                            "mahusiano": '',
                            'dob': selectedDate.toString()
                          };

                          postMethod(
                            endpoint: '/jisajili.php',
                            bodyData: _data,
                          ).then((value) {
                            print('jfjfjjfjf $value');
                            if (value['body']['status'] == "200") {
                              Navigator.pop(context);
                              respondMessage(
                                context,
                                isSuccess: true,
                                color: Theme.of(context).primaryColor,
                                title: "Succesfully",
                                subTitle: "You have been successfully registered",
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            } else if (value['body']['status'] == "302") {
                              Navigator.pop(context);
                              respondMessage(
                                context,
                                isSuccess: false,
                                color: Theme.of(context).primaryColor,
                                title: "Unsuccessfull",
                                subTitle: value['body']['message'],
                              );
                            } else if (value['body']['status'] == "300") {
                              Navigator.pop(context);

                              respondMessage(
                                context,
                                isSuccess: false,
                                color: Theme.of(context).primaryColor,
                                title: "Unsuccesfully",
                                subTitle: value['body']['message'],
                              );
                            }
                          });
                        }
                      },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
