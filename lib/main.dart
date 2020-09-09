import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main(){
  runApp(TravelUI());
}

class TravelUI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}
