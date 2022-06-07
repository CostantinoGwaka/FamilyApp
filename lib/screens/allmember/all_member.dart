import 'package:familyapp/screens/family/widget/each_family.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';

class AllMember extends StatefulWidget {
  const AllMember({Key key}) : super(key: key);

  @override
  State<AllMember> createState() => _AllMemberState();
}

class _AllMemberState extends State<AllMember> {
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
      body: ListView.builder(
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
    );
  }
}
