import 'package:familyapp/core/api/services/data_service.dart';
import 'package:familyapp/screens/widget/ui_helpers.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Information'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        UIHelper.verticalSpace(height: 10),
                        CircleAvatar(
                          maxRadius: 45,
                          backgroundImage: AssetImage('images/user.png'),
                        ),
                        UIHelper.verticalSpace(height: 10),
                        Text(DataService.userData['fullname']),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(88, 20, 88, 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('Gender'),
                                  UIHelper.verticalSpace(height: 10),
                                  Text(DataService.userData['gender']),
                                ],
                              ),
                              UIHelper.horizontalSpace(width: 5),
                              Container(
                                height: 40,
                                width: 2,
                                color: Colors.black,
                              ),
                              UIHelper.horizontalSpace(width: 5),
                              Column(
                                children: [
                                  Text('Age'),
                                  UIHelper.verticalSpace(height: 10),
                                  Text('32'),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Taarifa binafsi',
                    style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.grey, fontSize: 25),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(
                      DataService.userData['phone'],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on_sharp),
                    title: Text(
                      DataService.userData['location'],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.work),
                    title: Text(
                      DataService.userData['job'] ?? 'Hakuna taarifa',
                    ),
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
