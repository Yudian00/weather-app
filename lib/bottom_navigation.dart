import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:weather_app/ui/explore_page.dart';
import 'package:weather_app/ui/home_page.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

enum _SelectedTab { home, likes, search, profile }

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  var _selectedTab = _SelectedTab.home;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ExplorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _selectedTab = _SelectedTab.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height / 14.64,
            vertical: MediaQuery.of(context).size.height / 73.2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: SalomonBottomBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          onTap: _onItemTapped,
          selectedItemColor: Color(0xFF101859),
          unselectedItemColor: Colors.grey,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text("Home"),
            ),

            /// Explore
            SalomonBottomBarItem(
              icon: Icon(Icons.explore_outlined),
              title: Text("Explore"),
            ),
          ],
        ),
      ),
    );
  }
}
