import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui_project/widgets/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  int _selectedTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: () => {
        setState((){
          _selectedIndex = index;
        })
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: _selectedIndex == index ? Theme.of(context).accentColor : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index ? Theme.of(context).primaryColor : Color(0xFFB4C1C4),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 80.0),
              child: Text("What would you like to find?", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildIcon(map.key))
                  .toList()
            ),
            SizedBox(height: 20.0,),
            DestinationCarousel()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (int value){
          setState(() {
            _selectedTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0
            ),
            title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.local_pizza,
                size: 30.0
            ),
            title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 15.0,
                  backgroundImage: NetworkImage("https://yt3.ggpht.com/a-/AOh14GgJD3mw7o-vbgwdBlr0zaxuCzpjwvdabrE45GiRbQ=s100-c-k-c0xffffffff-no-rj-mo"),
              ),
              title: SizedBox.shrink()
          ),
        ],
      ),
    );
  }
}
