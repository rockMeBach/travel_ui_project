import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(TravelUI());
}

class TravelUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "Flutter Travel UI",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF3EBACE),
          accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
        ),
        home: HomeScreen(),
    );
  }
}
