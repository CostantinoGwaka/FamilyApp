import 'package:familyapp/core/api/services/data_service.dart';
import 'package:familyapp/screens/family/widget/each_family.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';

class FamilyDescription extends StatefulWidget {
  final String title;
  FamilyDescription({Key key, this.title}) : super(key: key);

  @override
  State<FamilyDescription> createState() => _FamilyDescriptionState();
}

class _FamilyDescriptionState extends State<FamilyDescription> {
  int agedate({String date}) {
    String datesss = date;
    DateTime dates = DateTime.parse(datesss);

    final date2 = DateTime.now();
    final difference = date2.difference(dates).inDays / 365;

    return difference.floor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
          child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: DataService.myFamilyList.length,
        itemBuilder: (context, index) {
          var data = DataService.myFamilyList[index];
          return Card(
            child: Column(children: [
              manualStepper(),
              ListTile(
                leading: CircleAvatar(
                  maxRadius: 35,
                  backgroundImage: AssetImage('images/user.png'),
                ),
                title: Text(data['fname']),
                subtitle: Row(
                  children: [
                    Text(data['gender']),
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
                          id: data['id'],
                          isSingle: 'true',
                          name: data['fname'],
                          location: data['location'],
                          gender: data['gender'],
                          age: '1990-07-19',
                          phone: data['phone'],
                          parentId: data['parent_id'],
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
      )),
    );
  }
}
