import 'package:familyapp/core/api/index.dart';
import 'package:familyapp/core/api/services/data_service.dart';
import 'package:familyapp/screens/dashboard/dashboard.dart';
import 'package:familyapp/screens/widget/buttons.dart';
import 'package:familyapp/screens/widget/global_widget.dart';
import 'package:familyapp/screens/widget/input.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key key}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController location = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;

  bool titleValidate() {
    return title.text.isNotEmpty;
  }

  bool locationValidate() {
    return location.text.isNotEmpty;
  }

  bool descriptionValidate() {
    return description.text.isNotEmpty;
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

  void _handleRememberme(bool value) {
    _isChecked = value;
    setState(() {
      _isChecked = value;
    });
  }

  TimeOfDay initialTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (picked != null && picked != initialTime) {
      setState(() {
        initialTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                manualStepper(step: 10),
                UniversalInput(
                  controller: title,
                  label: "Event Title",
                  hint: 'eg. Kikao cha harusi',
                  havePrefix: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ),
                  ),
                  validator: (val) => titleValidate() ? null : "Please enter your title",
                ),
                manualStepper(step: 10),
                UniversalInput(
                  havePrefix: false,
                  controller: location,
                  label: "Event Location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ),
                  ),
                  validator: (val) => locationValidate() ? null : "Please enter event location",
                  hint: 'eg. Mbezi mwisho',
                ),
                manualStepper(step: 10),
                UniversalInput(
                  controller: description,
                  havePrefix: false,
                  minLines: 6,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  validator: (val) => descriptionValidate() ? null : "Please enter description  message ",
                  hint: 'Write here ...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ),
                  ),
                  label: "Event Description",
                ),
                manualStepper(step: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Date'),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey, // red as border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
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
                      GestureDetector(
                        onTap: () => _selectTime(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Time'),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey, // red as border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      initialTime.format(context),
                                    ),
                                    manualSpacer(step: 10),
                                    const Icon(
                                      Icons.access_time,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Switch(
                            activeColor: Theme.of(context).primaryColor,
                            value: _isChecked,
                            onChanged: _handleRememberme,
                          ),
                          const Text(
                            'Only for family',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                manualStepper(step: 20),
                UniversalButton(
                  buttonHeight: 53,
                  radius: 20,
                  action: () {
                    if (_formKey.currentState.validate()) {
                      var _data = {
                        'title': title.text,
                        'descp': description.text,
                        'date': selectedDate.toString(),
                        'time': initialTime.toString(),
                        'status': _isChecked.toString(),
                        'location': location.text,
                        'family_id': DataService.userData['id']
                      };

                      universalLoading(context, content: "Please wait..");
                      postMethod(bodyData: _data, endpoint: 'create_event.php').then((value) {
                        if (value['code'] == 200) {
                          print("here my result $value");
                          Navigator.pop(context);

                          respondMessage(
                            context,
                            isSuccess: true,
                            title: "Successfully",
                            subTitle: value['body']['message'],
                          );
                          title.clear();
                          description.clear();
                          location.clear();
                        } else {
                          Navigator.pop(context);
                          respondMessage(
                            context,
                            isSuccess: false,
                            title: "Unsuccessfully",
                            subTitle: value['body']['message'],
                          );
                        }
                      });
                    }
                  },
                  buttonColor: Theme.of(context).primaryColor,
                  child: Text("Add Event"),
                  buttonWidth: deviceWidth(context) / 1.1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
