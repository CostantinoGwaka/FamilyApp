import 'package:familyapp/screens/family/widget/each_family.dart';
import 'package:familyapp/utilities/constant.dart';
import 'package:flutter/material.dart';

class AllFamily extends StatefulWidget {
  const AllFamily({Key key}) : super(key: key);

  @override
  State<AllFamily> createState() => _AllFamilyState();
}

class _AllFamilyState extends State<AllFamily> {
  final TextStyle dropdownMenuItem = TextStyle(color: Colors.black, fontSize: 18);

  final primary = Colors.blue;
  final secondary = Colors.deepOrange;

  final List<Map> schoolLists = [
    {"single": "false", "name": "Constanino Gwaka", "location": "Bonyokwa - 119", "type": "Total: 6", "logoText": "images/user.png"},
    {"single": "true", "name": "Cosmas Paulo", "location": "Mbezi - 289", "type": "Total: 5", "logoText": "images/user.png"},
    {"single": "true", "name": "Samweli Gwaka", "location": "Residential park, Lane - 2", "type": "Total: 3", "logoText": "images/user.png"},
    {"single": "false", "name": "Angela Cosmas", "location": "Tabata - 453", "type": "Total: 9", "logoText": "images/user.png"},
    {"single": "false", "name": "Angela Cosmas", "location": "Tabata - 453", "type": "Total: 9", "logoText": "images/user.png"},
    {"single": "false", "name": "Angela Cosmas", "location": "Tabata - 453", "type": "Total: 9", "logoText": "images/user.png"},
    {"single": "false", "name": "Angela Cosmas", "location": "Tabata - 453", "type": "Total: 9", "logoText": "images/user.png"},
    {"single": "false", "name": "Angela Cosmas", "location": "Tabata - 453", "type": "Total: 9", "logoText": "images/user.png"},
    {"single": "false", "name": "victor Salim", "location": "Posta - 763", "type": "Total: 3", "logoText": "images/user.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'All Families',
          style: Theme.of(context).textTheme.headline6,
        ),
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
      ),
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        child: TextField(
                          // controller: TextEditingController(text: locations[0]),
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                            hintText: "Search Families or member",
                            hintStyle: TextStyle(
                              color: Colors.black38,
                              fontSize: 16,
                            ),
                            prefixIcon: Material(
                              elevation: 0.0,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              child: Icon(
                                Icons.search,
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    physics: physics,
                    itemCount: schoolLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildList(context, index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        width: double.infinity,
        height: 110,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 3,
                ),
                image: DecorationImage(image: AssetImage(schoolLists[index]['logoText']), fit: BoxFit.fill),
              ),
            ),
            Expanded(
              child: Column(
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
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(schoolLists[index]['type'], style: TextStyle(color: primary, fontSize: 13, letterSpacing: .3)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
