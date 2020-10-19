import 'package:flutter/material.dart';
import 'package:videoaudio/smallcomponents/rectsquare.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  var trending = [
    {
      "name": "TRENDING",
      "image": "images/thumb/one.png",
      "inimage": "LATEST TOP TRENDING SONGS 2020",
      "slist": [
        [
          "FITOOR",
          "assets/fitoor.mp3",
          "ARJIT SINGH",
          "images/thumb/fitoor.jpg",
        ],
        [
          "KALANK",
          "assets/kalank.mp3",
          "ARJIT SINGH",
          "images/thumb/kalank.jpg",
        ],
        [
          "NIKLE CURRENT",
          "assets/nikle.mp3",
          "NEHA KAKKAR",
          "images/thumb/nikle.jpg",
        ],
        [
          "KHARIYAT",
          "assets/khariyat.mp3",
          "ARJIT SINGH",
          "images/thumb/khariyat.jpg",
        ],
        [
          "MILE HO TUM",
          "assets/mile.mp3",
          "NEHA KAKKAR",
          "images/thumb/mile.jpg",
        ],
        [
          "SHAYAD",
          "assets/shayad.mp3",
          "ARJIT SINGH",
          "images/thumb/shayad.jpg",
        ],
      ]
    },
    {
      "name": "OLD SONGS",
      "image": "images/thumb/two.png",
      "inimage": "SONGS OF THE GOLDEN ERA (1990-2000)",
      "slist": [
        [
          "FIRST",
          "assets/FIRST.mp3",
          "A.R RAHMAN",
          "images/artists/ar.png",
        ],
        [
          "SECOND",
          "assets/SE.mp3",
          "A.R RAHMAN",
          "images/artists/ar.png",
        ],
        [
          "THIRD",
          "assets/TH.mp3",
          "A.R RAHMAN",
          "images/artists/ar.png",
        ],
        [
          "FIRST",
          "assets/FIRST.mp3",
          "A.R RAHMAN",
          "images/artists/ar.png",
        ],
        [
          "SECOND",
          "assets/SE.mp3",
          "A.R RAHMAN",
          "images/artists/ar.png",
        ],
        [
          "THIRD",
          "assets/TH.mp3",
          "A.R RAHMAN",
          "images/artists/ar.png",
        ]
      ]
    },
    {
      "name": "SONGS FOR YOU",
      "image": "images/artists/sonu.png",
      "inimage": "SPECIAL COLLECTION FOR YOU",
      "slist": [
        [
          "FIRST",
          "assets/FIRST.mp3",
          "A.R RAHMAN",
          "images/artists/ar.png",
        ],
        [
          "SECOND",
          "assets/SE.mp3",
          "A.R RAHMAN",
          "images/artists/ar.png",
        ],
        [
          "THIRD",
          "assets/TH.mp3",
          "A.R RAHMAN",
          "images/artists/ar.png",
        ],
        [
          "FIRST",
          "assets/FIRST.mp3",
          "A.R RAHMAN",
          "images/artists/ar.png",
        ],
        [
          "SECOND",
          "assets/SE.mp3",
          "A.R RAHMAN",
          "images/artists/ar.png",
        ],
        [
          "THIRD",
          "assets/TH.mp3",
          "A.R RAHMAN",
          "images/artists/ar.png",
        ]
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      // color: Colors.black,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,

          // scrollDirection: Axis.horizontal,
          itemCount: trending.length,
          itemBuilder: (BuildContext context, int index) {
            return Cardcategory(
              name: trending[index]["name"],
              imagelo: trending[index]["image"],
              list: trending[index]["slist"],
              inimage: trending[index]["inimage"],
              widthi: 180.00,
            );
          }),
    );
  }
}
