import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(null),
        centerTitle: true,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(7),
            width: 45,
            height: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/JPEG/cat6.jpg"),
                    fit: BoxFit.cover),
                shape: BoxShape.circle),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text("Today",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500)),
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(24),
                  height: 130,
                  width: ((MediaQuery.of(context).size.width - 32) / 2) - 8,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.cyan, Colors.blue]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Step",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text("3,210",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  padding: EdgeInsets.all(24),
                  height: 130,
                  width: ((MediaQuery.of(context).size.width - 32) / 2) - 8,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.orangeAccent]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Sport",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text("32 Min.",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text("Activity",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
            ),
            Expanded(
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      child: Text("Task",style: TextStyle(fontSize: 18),),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 4),
            )
          ],
        ),
      ),
    );
  }
}
