import 'package:familyapp/core/api/request_method.dart';
import 'package:familyapp/core/api/services/data_service.dart';
import 'package:familyapp/screens/widget/buttons.dart';
import 'package:familyapp/screens/widget/global_widget.dart';
import 'package:familyapp/screens/widget/input.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FamiliySettings extends StatefulWidget {
  const FamiliySettings({Key key}) : super(key: key);

  @override
  State<FamiliySettings> createState() => _FamiliySettingsState();
}

class _FamiliySettingsState extends State<FamiliySettings> {
  var _phoneController = TextEditingController();
  var _nameController = TextEditingController();
  var _patnernameController = TextEditingController();
  var _passController = TextEditingController();
  var _codeController = TextEditingController();
  var _locationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = '';
  String relation = 'Children';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Member'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                manualStepper(step: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please select relationship';
                      }
                      return null;
                    },
                    hint: Text('eg. Husband'),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.family_restroom),
                      label: Text('Relationship'),
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
                        relation = newValue;
                      });
                    },
                    items: <String>[
                      'Husband/Wife',
                      'Children',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                manualStepper(step: 20),
                relation == "Husband/Wife"
                    ? UniversalInput(
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
                      )
                    : UniversalInput(
                        prefixIcon: Icons.person,
                        controller: _patnernameController,
                        label: "Fullname",
                        hint: "eg. Rumishaeli Msinga Moshi",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.0,
                          ),
                        ),
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
                manualStepper(step: 20),
                UniversalButton(
                  buttonHeight: 53,
                  radius: 20,
                  buttonColor: Theme.of(context).primaryColor,
                  child: Text("Add Member"),
                  buttonWidth: deviceWidth(context) / 1.1,
                  action: () {
                    if (_formKey.currentState.validate()) {
                      universalLoading(context, content: 'Please wait...');

                      var _data = {
                        "fname": _nameController.text,
                        "gender": dropdownValue,
                        "phone": _phoneController.text ?? '',
                        "location": _locationController.text ?? DataService.userData['location'],
                        "parent_id": relation == "Husband/Wife" ? '' : DataService.userData['id'],
                        "code": _codeController.text,
                        "password": '12345678',
                        "mahusiano": relation == "Husband/Wife" ? DataService.userData['id'] : '',
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
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Login(),
                          //   ),
                          // );
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
