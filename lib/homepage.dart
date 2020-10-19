import 'dart:io';
// import 'package:audio_picker/audio_picker.dart';
import 'package:flutter/material.dart';
import 'package:videoaudio/listcomponents/artists.dart';
import 'package:videoaudio/listcomponents/trending.dart';
import 'package:file_picker/file_picker.dart';
import 'package:videoaudio/listcomponents/video.dart';
// import 'package:videoaudio/smallcomponents/songpage.dart';

import 'smallcomponents/songpage.dart';
import 'smallcomponents/videopage.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

// import 'package:audio_picker/audio_picker.dart';
class HomePage extends StatelessWidget {
  // AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    var rowsearch = Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 10),
            width: 20,
            child: Icon(Icons.link),
          ),
        ),
        Expanded(
          flex: 9,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
            child: TextField(
              decoration: InputDecoration(
                hintText: "LINK OF AUDIO",
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
              onSubmitted: (String str) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SongPage(
                      slist: [
                        [
                          "ONLINE AUDIO",
                          str,
                          "INTERNET",
                          "images/artists/musiclocal.jpg",
                        ]
                      ],
                      index: 0,
                      type: 2,
                    ),
                  ),
                );
              },
              cursorColor: Colors.black,
              cursorWidth: 0.7,
            ),
          ),
        ),
      ],
    );
    var rowsearch1 = Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 10),
            width: 20,
            child: Icon(Icons.link),
          ),
        ),
        Expanded(
          flex: 9,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
            child: TextField(
              onSubmitted: (String str) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Song2Page(
                      fslist: [
                        ["ONLINE VIDEO", str]
                      ],
                      index: 0,
                      type: 2,
                    ),
                  ),
                );
              },
              decoration: InputDecoration(
                hintText: "LINK OF VIDEO",
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
                helperMaxLines: 1,
                errorMaxLines: 1,
                border: InputBorder.none,
              ),
              cursorColor: Colors.black,
              cursorWidth: 0.7,
            ),
          ),
        ),
      ],
    );
    var expandedappbar = Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.black,
      height: 50,
      child: Column(
        children: <Widget>[
          // Expanded(
          //   flex:1,
          //   child: Container(width: double.infinity, color: Colors.black),
          // ),
          Expanded(
            flex: 10,
            child: Container(
              // margin: EdgeInsets.only(bottom:0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: Colors.white,
                  ),
                  child: rowsearch,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    var expandedappbar1 = Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.black,
      height: 50,
      child: Column(
        children: <Widget>[
          // Expanded(
          //   flex:1,
          //   child: Container(width: double.infinity, color: Colors.black),
          // ),
          Expanded(
            flex: 10,
            child: Container(
              // margin: EdgeInsets.only(bottom:0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: Colors.white,
                  ),
                  child: rowsearch1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    var col2 = Colors.white;
    var col1 = Colors.black;
    // String filepath;
    // Future<String> filepath;
    // String file;
    // String filep;
    // File file;
    File _images;
    String _images1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: col1,
        // toolbarOpacity: 1,
        centerTitle: true,
        // leading: Icon(Icons.music_note),
        elevation: 0,
        title: Text(
          "PLAYER",
          style: TextStyle(color: col2),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () async => {
                _images1 = await FilePicker.getFilePath(),
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SongPage(
                      index: 0,
                      type: 1,
                      slist: [
                        [
                          "Local Audio",
                          _images1,
                          "Phone",
                          "images/artists/musiclocal.jpg",
                        ],
                      ],
                    ),
                  ),
                ),
              },
              child: CircleAvatar(
                // maxRadius: 10,
                // minRadius: 20,
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.music_note,
                  color: Colors.black,
                ),
                // backgroundImage: AssetImage(
                //   "images/sar.jpg",
                // ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color:Colors.black,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.bottomCenter,
        //     end: Alignment.topCenter,
        //   ),

        // ),
        child: ListView(
            padding: EdgeInsets.all(5),
          children: <Widget>[
                expandedappbar,
                SizedBox(
                  height: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "TOP ARTISTS",
                      style: TextStyle(
                          color: col2, fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Artist(),
                Container(
                  height: 20,
                  padding: const EdgeInsets.only(left: 10.0),
                  margin: EdgeInsets.only(bottom: 10),
                  // margin:EdgeInsets.all(left),
                  child: Text(
                    "TOP ALBUMS",
                    style: TextStyle(
                        color: col2, fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Trending(),
                ListTile(
                  title: Text(
                    "VIDEOS",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                          icon: Icon(
                            Icons.music_video,
                            color: Colors.black,
                          ),
                          onPressed: () async => {
                                // path = await AudioPicker.pickAudio(),
                                // ignore: await_only_futures
                                // file = FilePicker.getFilePath() as File,
                                _images = await FilePicker.getFile(),
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Song2Page(
                                      fslist: [
                                        [
                                          "LOCAL VIDEO",
                                          _images,
                                        ],
                                      ],
                                      index: 0,
                                      type: 1,
                                    ),
                                  ),
                                ),
                              })),
                ),
            expandedappbar1,
                Artistss()
          ],
          // ),
        ),
      ),
    );
  }
}
