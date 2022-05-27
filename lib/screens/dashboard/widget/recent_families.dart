import 'package:familyapp/screens/family/widget/each_family.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';

class RecentFamilies extends StatefulWidget {
  const RecentFamilies({Key key}) : super(key: key);

  @override
  State<RecentFamilies> createState() => _RecentFamiliesState();
}

class _RecentFamiliesState extends State<RecentFamilies> {
  final primary = Colors.blue;
  final secondary = Colors.deepOrange;

  final List<Map> schoolLists = [
    {"single": "false", "name": "Constanino Gwaka", "location": "Bonyokwa - 119", "type": "Watu: 6", "logoText": "images/user.png"},
    {"single": "true", "name": "Cosmas Paulo", "location": "Mbezi - 289", "type": "Watu: 5", "logoText": "images/user.png"},
    {"single": "true", "name": "Samweli Gwaka", "location": "Residential park, Lane - 2", "type": "Watu: 3", "logoText": "images/user.png"},
    {"single": "false", "name": "Angela Cosmas", "location": "Tabata - 453", "type": "Watu: 9", "logoText": "images/user.png"},
    {"single": "false", "name": "victor Salim", "location": "Posta - 763", "type": "Watu: 3", "logoText": "images/user.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ListView.builder(
        physics: physics,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EachFamiy(
                        isSingle: schoolLists[index]['single'],
                        location: schoolLists[index]['location'],
                        name: schoolLists[index]['name'],
                        gender: "Me",
                        job: 'Mfanyabiashara',
                        age: "1998-01-13"),
                  ));
            },
            child: Card(
                shape: shape,
                elevation: 1,
                child: SizedBox(
                  width: deviceWidth(context) / 1.3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 3, color: secondary),
                            image: DecorationImage(image: AssetImage(schoolLists[index]['logoText']), fit: BoxFit.fill),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              schoolLists[index]['name'],
                              style: TextStyle(color: primary, fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: secondary,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(schoolLists[index]['location'], style: TextStyle(color: primary, fontSize: 13, letterSpacing: .3)),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.group,
                                  color: secondary,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(schoolLists[index]['type'], style: TextStyle(color: primary, fontSize: 13, letterSpacing: .3)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
