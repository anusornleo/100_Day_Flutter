import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<String> listDay = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "18",
    "19",
    "20"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("100 Day of flutter by Leo"),
          elevation: 0,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/${listDay[index]}');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28),
                          child: Text(
                            "Day ${listDay[index]}",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                      height: 80,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 10,
              );
            },
            itemCount: listDay.length));
  }
}
