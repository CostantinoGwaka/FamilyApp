import 'package:familyapp/screens/account/account.dart';
import 'package:familyapp/screens/allmember/all_member.dart';
import 'package:familyapp/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  final Widget _home = DashBoard();
  final Widget _allMember = AllMember();
  final Widget _account = const Account();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: getBody(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(
            color: Colors.grey,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 25,
                color: selectedIndex == 0
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.groups_rounded,
                size: 25,
                color: selectedIndex == 1
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              label: "Member",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_sharp,
                size: 25,
                color: selectedIndex == 2
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              label: "Account",
            ),
          ],
          onTap: (int index) {
            onTapHandler(index);
          },
        ),
      ),
    );
  }

  Widget getBody() {
    if (selectedIndex == 0) {
      return _home;
    } else if (selectedIndex == 1) {
      return _allMember;
    } else if (selectedIndex == 2) {
      return _account;
    } else {
      return _account;
    }
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
