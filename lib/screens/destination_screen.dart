import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui_project/models/activity_model.dart';
import 'package:travel_ui_project/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationScreen extends StatefulWidget{
  final Destination destination;

  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen>{

  Widget _buildRatingStars(int rating){
    return Row(
      children: List.generate(rating,(index) {
        return Icon(
          Icons.star,
          size: 15.0,
          color: Colors.amber,
        );
      })
    );
  }

  Widget _buildStartTime(String value){
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      width: 70.0,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(15.0)
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(5.0),
      child: Text(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0,2.0),
                      blurRadius: 6.0,
                    ),
                  ]
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit:BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () => null,
                        ),
                        IconButton(
                          icon: Icon(Icons.sort),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () => null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.destination.city, style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
                    Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.locationArrow, size: 10.0, color: Colors.white,),
                          SizedBox(width: 5.0,),
                          Text(widget.destination.country, style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ]
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index){
                Activity activity = widget.destination.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100.0, 20.0, 15.0, 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width*0.3,
                                  child: Text(
                                    activity.name,
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0,),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text('\$${activity.price}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0,),),
                                      Text("per pax", style: TextStyle(color: Colors.grey),),
                                    ]
                                  ),
                                ),
                              ]
                            ),
                            Text(activity.type),
                            SizedBox(height: 10.0,),
                            _buildRatingStars(activity.rating),
                            SizedBox(height: 10.0,),
                            Row(
                              children: activity.startTimes.asMap().entries.map((MapEntry map) => _buildStartTime(map.value)).toList(),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          width: 110.0,
                          image: AssetImage(activity.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                );
              }
            ),
          )
        ],
      ),
    );
  }
  
}