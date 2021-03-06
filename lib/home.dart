import 'package:data/about.dart';
import 'package:data/drawer.dart';
import 'package:data/profile.dart';
import 'package:data/settings.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    About(),
    Profile(),
    SettingsPage(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA5D4DC),
      //body: MemberList(),
      body: _children[_currentIndex],

      drawer: MyDrawer(
        onTap: () {

        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        backgroundColor: Color(0xff415A80),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home,
              color: Color(0xffA5D4DC),),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.account_box_outlined,
              color: Color(0xffA5D4DC),),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.call,
              color: Color(0xffA5D4DC),
            ),
          ),
        ],
      ),
    );
  }
}