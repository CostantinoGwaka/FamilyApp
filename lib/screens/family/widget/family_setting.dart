import 'package:familyapp/screens/widget/buttons.dart';
import 'package:familyapp/screens/widget/input.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';

class FamiliySettings extends StatefulWidget {
  const FamiliySettings({Key key}) : super(key: key);

  @override
  State<FamiliySettings> createState() => _FamiliySettingsState();
}

class _FamiliySettingsState extends State<FamiliySettings> {
  String dropdownValue = '';
  String relation = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Member'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              UniversalInput(
                prefixIcon: Icons.person,
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
              UniversalInput(
                helperText: 'Optional',
                prefixIcon: Icons.phone,
                label: "Phonenumber",
                hint: "eg. 0746789878",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1.0,
                  ),
                ),
              ),
              manualStepper(step: 10),
              UniversalInput(
                helperText: 'Optional - leave empty if live in you location',
                prefixIcon: Icons.location_on,
                label: "Location",
                hint: "eg. Kawe - 119",
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
              manualStepper(step: 20),
              UniversalButton(
                buttonHeight: 53,
                radius: 20,
                action: () {},
                buttonColor: Theme.of(context).primaryColor,
                child: Text("Add member"),
                buttonWidth: deviceWidth(context) / 1.1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
