import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Day1 extends StatefulWidget {
  @override
  _Day1State createState() => _Day1State();
}

class _Day1State extends State<Day1> {
  List<String> listImage = [
    'assets/JPEG/cat1.jpg',
    'assets/JPEG/cat2.jpg',
    'assets/JPEG/cat3.jpg',
    'assets/JPEG/cat4.jpg',
    'assets/JPEG/cat5.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black54,
          iconSize: 30,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "First your",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Inspiration",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search your looking for",
                          prefixIcon: Icon(
                            Icons.search,
                            size: 28,
                            color: Colors.black54,
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        "Promo Today",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      height: 200,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: listImage.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 132,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(listImage[index]),
                                    fit: BoxFit.cover)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black54,
                                        Colors.black54.withOpacity(0)
                                      ])),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 12,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            Container(
              height: 170,
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/JPEG/landscape1.jpg"),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green
                  ),

                ),

            ],
          ),
        ),
      ),
    );
  }
}
