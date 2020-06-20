import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Album extends StatefulWidget {
  const Album(
      {this.cover, this.address, this.pics, this.profilePic, this.name});

  final String cover;
  final String profilePic;
  final String name;
  final List<String> pics;
  final String address;

  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage(widget.cover), fit: BoxFit.cover)),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 27,
                          backgroundImage: AssetImage(widget.profilePic),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [Icon(Icons.pin_drop), Text(widget.address)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: StaggeredGridView.countBuilder(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                itemCount: widget.pics.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.pics[index]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(14)),
                  );
                },
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(2, (index % 4 == 0) ? 2 : 2.5);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
