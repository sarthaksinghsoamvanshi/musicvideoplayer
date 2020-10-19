import 'package:flutter/material.dart';
import 'package:videoaudio/smallcomponents/videopage.dart';
// import 'package:laten/file.dart';
// import 'package:laten/video1.dart';
// import 'package:videoaudio/smallcomponents/videopage.dart';
// import 'package:videoaudio/artists/artistpage.dart';
// import 'package:videoaudio/smallcomponents/circleartist.dart';

class Artistss extends StatefulWidget {
  @override
  _ArtistssState createState() => _ArtistssState();
}

class _ArtistssState extends State<Artistss> {
  var videos = [
    {
      "name": "TERA FITOOR",
      "image": "images/thumb/fitoor.jpg",
    },
    {
      "name": "KHARIYAT",
      "image": "images/thumb/khariyat.jpg",
    },
    {
      "name": "MILE HO TUM",
      "image": "images/thumb/mile.jpg",
    },
     {
      "name": "NIKLE CURRENT",
      "image": "images/thumb/nikle.jpg",
    },
  ];
  var vid = [
      [
        "TERA FITOOR",
        "assets/fitoor.mp4",
      ],
      [
        "KHARIYAT",
        "assets/khariyat.mp4",
      ],
      [
        "MILE HO TUM",
        "assets/mile.mp4",
      ],
      [
        "NIKLE CURRENT",
        "assets/nikle.mp4",
      ]
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      color: Colors.black,
      child: ListView.builder(
        itemCount: videos.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Cardartist(
              aname: videos[index]["name"],
              aimage: videos[index]["image"],
              // avideo: videos[index]["video"]
              aindex:index,
              avideo:vid);
          // avideos:videos;
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';

class Cardartist extends StatelessWidget {
  final aname;
  final avideo;
  final aindex;
  final aimage;
  // final a;

  const Cardartist({
    this.aname,
    this.avideo,
    this.aindex,
    this.aimage,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Song2Page(
            fslist: avideo,
            index: aindex,
            type: 0,
          ),
        ),
      ),
      child: Card(
        color: Colors.black,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                // radius: 50,
                child: Image.asset(aimage,fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  child: Text(
                    aname,
                    style: TextStyle(color: Colors.white),
                  ),
                  alignment: Alignment.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
