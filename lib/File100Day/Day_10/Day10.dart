import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day10 extends StatefulWidget {
  @override
  _Day10State createState() => _Day10State();
}

class _Day10State extends State<Day10> {
  List<String> listCat = [
    "assets/JPEG/cat1.jpg",
    "assets/JPEG/cat2.jpg",
    "assets/JPEG/cat3.jpg",
    "assets/JPEG/cat4.jpg",
    "assets/JPEG/cat5.jpg",
    "assets/JPEG/cat6.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[300],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text("Home"),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            width: 40,
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Center(
              child: Text(
                "0",
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Container(
              width: double.infinity - 32,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                      image: AssetImage("assets/JPEG/cat3.jpg"),
                      fit: BoxFit.cover)),
              child: Container(
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [Colors.black38, Colors.transparent]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "CatStyle",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 47,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        onPressed: () {},
                        color: Colors.white,
                        child: Text(
                          "Feed Now",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: listCat.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  String pic = listCat[index];
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(pic), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        margin: EdgeInsets.all(15),
//                        width: 10,
//                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(Icons.tag_faces),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
