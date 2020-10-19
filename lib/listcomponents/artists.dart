import 'package:flutter/material.dart';
import 'package:videoaudio/artists/artistpage.dart';
// import 'package:videoaudio/smallcomponents/circleartist.dart';

class Artist extends StatefulWidget {
  @override
  _ArtistState createState() => _ArtistState();
}

class _ArtistState extends State<Artist> {
  var artist = [
    {
      "name": "ARJIT SINGH",
      "image": "images/artists/arjit.png",
       "slist": [
        ["FITOOR", "assets/fitoor.mp3","ARJIT SINGH","images/thumb/fitoor.jpg",],
        ["KALANK", "assets/kalank.mp3","ARJIT SINGH","images/thumb/kalank.jpg",],
        ["KHARIYAT", "assets/khariyat.mp3","ARJIT SINGH","images/thumb/khariyat.jpg",],
        ["SHAYAD", "assets/shayad.mp3","ARJIT SINGH","images/thumb/shayad.jpg",],
      ]
    },
    {
      "name": "NEHA KAKKAR",
      "image": "images/artists/neha.png",
      "slist": [
        ["MILE HO TUM", "assets/mile.mp3","NEHA KAKKAR","images/thumb/mile.jpg",],
        ["KHUDA", "assets/khuda.mp3","NEHA KAKKAR","images/thumb/khuda.jpg",],
        ["NIKLE CURRENT", "assets/nikle.mp3","NEHA KAKKAR","images/thumb/nikle.jpg",],
        ["PUCHDA", "assets/puchda.mp3","NEHA KAKKAR","images/thumb/puchda.jpg",],
      ]
    },
    {
      "name": "SONU NIGAM",
      "image": "images/artists/sonu.png",
     "slist": [
        ["FIRST", "assets/FIRST.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["SECOND", "assets/SE.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["THIRD", "assets/TH.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["FIRST", "assets/FIRST.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["SECOND", "assets/SE.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["THIRD", "assets/TH.mp3","A.R RAHMAN","images/artists/ar.png",]
      ]
    },
    {
      "name": "B PRAKK",
      "image": "images/artists/bprakk.png",
    "slist": [
        ["FIRST", "assets/FIRST.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["SECOND", "assets/SE.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["THIRD", "assets/TH.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["FIRST", "assets/FIRST.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["SECOND", "assets/SE.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["THIRD", "assets/TH.mp3","A.R RAHMAN","images/artists/ar.png",]
      ]
    },
    {
      "name": "SHREYA GOSHAL",
      "image": "images/artists/shreya.png",
      "slist": [
        ["FIRST", "assets/FIRST.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["SECOND", "assets/SE.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["THIRD", "assets/TH.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["FIRST", "assets/FIRST.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["SECOND", "assets/SE.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["THIRD", "assets/TH.mp3","A.R RAHMAN","images/artists/ar.png",]
      ]
    },
    {
      "name": "A.R RAHMAN",
      "image": "images/artists/ar.png",
      "slist": [
        ["FIRST", "assets/FIRST.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["SECOND", "assets/SE.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["THIRD", "assets/TH.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["FIRST", "assets/FIRST.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["SECOND", "assets/SE.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["THIRD", "assets/TH.mp3","A.R RAHMAN","images/artists/ar.png",]
      ]
    },
    {
      "name": "LATA MAGESHKAR",
      "image": "images/artists/lata.png",
       "slist": [
        ["FIRST", "assets/FIRST.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["SECOND", "assets/SE.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["THIRD", "assets/TH.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["FIRST", "assets/FIRST.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["SECOND", "assets/SE.mp3","A.R RAHMAN","images/artists/ar.png",],
        ["THIRD", "assets/TH.mp3","A.R RAHMAN","images/artists/ar.png",]
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      color: Colors.black,
      child: ListView.builder(
        itemCount: artist.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Cardartist(
              aname: artist[index]["name"],
              aimage: artist[index]["image"],
              aslist: artist[index]["slist"]);
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';

class Cardartist extends StatelessWidget {
  final aname;
  final aslist;
  final aimage;

  const Cardartist({
    this.aname,
    this.aslist,
    this.aimage,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ArtistPage(
            fname: aname,
            fimage: aimage,
            fslist: aslist,
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
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(aimage),
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
