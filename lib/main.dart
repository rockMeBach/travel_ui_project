import 'package:flutter/material.dart';

void main(){
  runApp(TravelUI());
}

class TravelUI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(title: Text("Helo")),
          body: Text("hello")
      ),
    );
  }
}
