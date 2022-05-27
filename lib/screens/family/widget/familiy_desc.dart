import 'package:familyapp/screens/family/widget/each_family.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';

class FamilyDescription extends StatefulWidget {
 final  String title;
  FamilyDescription({Key key, this.title}) : super(key: key);

  @override
  State<FamilyDescription> createState() => _FamilyDescriptionState();
}

class _FamilyDescriptionState extends State<FamilyDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
          child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Column(children: [
              manualStepper(),
              ListTile(
                leading: CircleAvatar(
                  maxRadius: 35,
                  backgroundImage: AssetImage('images/user.png'),
                ),
                title: Text('John Constanino'),
                subtitle: Row(
                  children: [
                    Text('Me'),
                    manualSpacer(),
                    Container(
                      height: 10,
                      width: 2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                    manualSpacer(),
                    Text('Miaka 17'),
                  ],
                ),
                trailing: TextButton(
                  child: Text('Ona zaidi'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EachFamiy(
                          isSingle: 'true',
                          name: 'John Constantino',
                          location: 'Mbezi Beach - 1298',
                          gender: 'Me',
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
