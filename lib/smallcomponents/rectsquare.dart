import 'package:flutter/material.dart';
import 'package:videoaudio/artists/artistpage.dart';
class Cardcategory extends StatelessWidget {
  final imagelo;
  final name;
  final inimage;
  final widthi;
  final list;

  const Cardcategory({this.imagelo, this.name, this.inimage,this.widthi,this.list});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ArtistPage(
            fname: name,
            fimage: imagelo,
            fslist: list,
          ),
        ),
      ),
          child: Column(
        children: <Widget>[
          Container(
            // color: Colors.amber,
            width:widthi,
            height: 100,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              //  color: Colors.amber,
              image:
                  DecorationImage(image: AssetImage(imagelo), fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                child: Wrap(children: <Widget>[
                  Text(
                    inimage,
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
                alignment: Alignment.bottomLeft,
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(name, style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
