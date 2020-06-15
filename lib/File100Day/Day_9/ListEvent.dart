import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListEvent extends StatefulWidget {
  @override
  _ListEventState createState() => _ListEventState();
}

class _ListEventState extends State<ListEvent> {
  List<Map> eventList = [
    {
      "date": "8",
      "month": "MAY",
      "pic": "assets/JPEG/landscape1.jpg",
      "name": "Balloon",
      "time": "19:00"
    },
    {
      "date": "9",
      "month": "MAY",
      "pic": "assets/JPEG/landscape2.jpg",
      "name": "Ice",
      "time": "17:00"
    },
    {
      "date": "10",
      "month": "MAY",
      "pic": "assets/JPEG/landscape3.jpg",
      "name": "Forest",
      "time": "08:00"
    },
    {
      "date": "11",
      "month": "MAY",
      "pic": "assets/JPEG/landscape4.jpg",
      "name": "Mountain",
      "time": "15:00"
    },
    {
      "date": "12",
      "month": "MAY",
      "pic": "assets/JPEG/landscape5.jpg",
      "name": "Lake",
      "time": "22:00"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          elevation: 0,
          leading: Icon(null),
          backgroundColor: Colors.white,
          actions: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(right: 5),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/JPEG/cat3.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 0,
                  child: Container(
                    width: 15,
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3.0, color: Colors.white),
                        color: Colors.red,
                        shape: BoxShape.circle),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 32, right: 32, top: 16),
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 32),
              decoration: BoxDecoration(),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                    hintText: "Search Event",
                    border: InputBorder.none),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: eventList.length,
                itemBuilder: (context, index) {
                  String name = eventList[index]["name"];
                  String date = eventList[index]["date"];
                  String month = eventList[index]["month"];
                  String time = eventList[index]["time"];
                  String pic = eventList[index]["pic"];
                  return eventCard(date, month, pic, name, time);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Container eventCard(
      String date, String month, String pic, String name, String time) {
    return Container(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            child: Column(
              children: [
                Text(
                  date,
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 35,
                      fontWeight: FontWeight.w500),
                ),
                Text(month,
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ],
            ),
            alignment: Alignment.topCenter,
          ),
          Container(
            padding: EdgeInsets.all(32),
            height: 200,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage(pic), fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      time,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                )
              ],
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          )
        ],
      ),
    );
  }
}
