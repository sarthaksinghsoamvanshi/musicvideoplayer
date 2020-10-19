// import 'package:flute_music_player/flute_music_player.dart';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Song2Page extends StatefulWidget {
  final fslist;
  final index;
  final type;
  const Song2Page({this.fslist, this.type, this.index});
  @override
  _Song2PageState createState() => _Song2PageState();
}

class _Song2PageState extends State<Song2Page> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  var ind;
  var fav = 0;
  var value;
  Duration position = new Duration();
  Duration duration = new Duration();
  void noti() {
    seekToSecond(0);
    fav = 0;
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    _controller.seekTo(newDuration);
  }

  Widget slider() {
    var i = _controller.value.position;
    var j = _controller.value.duration;
    return Slider(
        value: i.inSeconds.toDouble(),
        min: 0.0,
        activeColor: Colors.white,
        inactiveColor: Colors.blue,
        max: j.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  void control() {
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
  }

  void initState() {
    fav = 0;
    ind = widget.index;
    if (widget.type == 0) {
      _controller = VideoPlayerController.asset(widget.fslist[ind][1]);
    } else if (widget.type == 1) {
      _controller = VideoPlayerController.file(widget.fslist[ind][1]);
    } else if (widget.type == 2) {
      _controller = VideoPlayerController.network(widget.fslist[ind][1]);
    }
    //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
    control();
    // ind = widget.index;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 30,
          ),
          onPressed: () => {Navigator.of(context).pop()},
        ),
        backgroundColor: Colors.black,
        title: Container(
            height: 30,
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Text(
                  "PLAYING FROM PLAYLIST",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )),
                Expanded(
                    child: Text(
                  "${widget.fslist[ind][0]}",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ))
              ],
            )),
        centerTitle: true,
      ),
      body: Stack(children: <Widget>[
        ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 50),
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  );
                  // } else {
                  // return Center(
                  // child: CircularProgressIndicator(),
                  // );
                  // }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              // color: Colors.amber,
              height: 60,
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Text(
                            // widget.slist[ind][0],
                            "${widget.fslist[ind][0]}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          // padding: EdgeInsets.only(t),
                          child: Text(
                            "${widget.fslist[ind][0]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topRight,
                      // color: Colors.amber,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black,
                        // backgroundColor: ind == 0 ? Colors.grey : Colors.white,
                        child: IconButton(
                          // color: Colors.white,
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                          // onPressed: null,
                          onPressed: () => {
                            // assetsAudioPlayer.stop(),
                            setState(() {
                              // _controller.dispose();
                              seekToSecond(0);
                              // ind = 0;
                              // noti();
                              // _isplaying = true;
                            }),
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // slider(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black,
                      // backgroundColor: ind == 0 ? Colors.grey : Colors.white,
                      child: Center(
                        child: IconButton(
                            // color: Colors.white,
                            icon: Icon(
                              Icons.shuffle,
                              color: Colors.white,
                            ),
                            // onPressed:
                            // null,
                            onPressed: ind == widget.fslist.length
                                ? null
                                : () => {
                                      Navigator.of(context).pop(),
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => Song2Page(
                                                    fslist: widget.fslist,
                                                    index: widget.index + 1,
                                                    type: widget.type,
                                                  ))),
                                    }),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: ind == 0 ? Colors.grey : Colors.white,
                      child: Center(
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(
                            Icons.skip_previous,
                            color: Colors.black,
                          ),
                          // onPressed: null,
                          onPressed: () => {
                            ind == 0
                                ? null
                                : {
                                    Navigator.of(context).pop(),
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => Song2Page(
                                                  fslist: widget.fslist,
                                                  index: widget.index - 1,
                                                  type: widget.type,
                                                ))),
                                  }

                            // // _controller.pause(),
                            // // // _controller.dispose(),
                            // // control(),
                            // setState(() {
                            //   ind = ind - 1;
                            //   _controller = VideoPlayerController.asset(
                            //       widget.fslist[ind][1]);
                            // _isplaying = true;
                            // }),
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: IconButton(
                          icon: Icon(_controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow),
                          onPressed: () {
                            setState(() {
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                              } else {
                                _controller.play();
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: ind == widget.fslist.length - 1
                          ? Colors.grey
                          : Colors.white,
                      child: Center(
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(
                            Icons.skip_next,
                            color: Colors.black,
                          ),
                          onPressed: ind == widget.fslist.length - 1
                              ? null
                              : () => {
                                    Navigator.of(context).pop(),
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Song2Page(
                                          fslist: widget.fslist,
                                          index: widget.index + 1,
                                          type: widget.type,
                                        ),
                                      ),
                                    ),
                                  },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black,
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            fav == 0 ? Icons.favorite_border : Icons.favorite,
                            color: Colors.green,
                          ),
                          onPressed: () => setState(() {
                            fav == 0 ? fav = 1 : fav = 0;
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
