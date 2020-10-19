// import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
// import 'package:audio_picker/audio_picker.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class SongPage extends StatefulWidget {
  final slist;
  final type;
  final index;
  // final islocal;
  const SongPage({
    this.index,
    this.type,
    // this.islocal,
    this.slist,
  });
  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool _isplaying = false;
  var ind;
  var fav = 0;
  var value;
  void noti() {
    seekToSecond(0);
    fav = 0;
    // assetsAudioPlayer.open()
    if (widget.type == 0) {
      assetsAudioPlayer.open(
          Audio(
            widget.slist[ind][1],
            metas: Metas(
              title: widget.slist[ind][0],
              artist: widget.slist[ind][2],
              image: MetasImage.asset(
                  widget.slist[ind][3]), //can be MetasImage.network
            ),
          ),
          showNotification: true);
    } else if (widget.type == 1) {
      assetsAudioPlayer.open(
        Audio.file(
          widget.slist[ind][1],
        ),
      );
    } else if (widget.type == 2) {
      assetsAudioPlayer.open(
        Audio.network(
          widget.slist[ind][1],
        ),
      );
    }
  }

  void audio() async {
    if (_isplaying) {
      assetsAudioPlayer.pause();
      setState(() {
        _isplaying = false;
      });
    } else {
      assetsAudioPlayer.play();

      setState(() {
        _isplaying = true;
      });
    }
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    assetsAudioPlayer.seek(newDuration);
  }

  Widget slider() {
    return Slider(
        value: assetsAudioPlayer.currentPosition.value.inSeconds.toDouble(),
        min: 0.0,
        activeColor: Colors.white,
        inactiveColor: Colors.blue,
        max: 300,
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  void initState() {
    ind = widget.index;
    noti();
    _isplaying = true;
    super.initState();
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
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
                  "${widget.slist[ind][0]} - ${widget.slist[ind][2]}",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ))
              ],
            )),
        centerTitle: true,
      ),
      body: Stack(children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  // boxShadow: ,
                  borderRadius: BorderRadius.all(Radius.circular(142)),
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: 140,
                    backgroundImage: AssetImage(widget.slist[ind][3]),
                  ),
                ),
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
                            widget.slist[ind][0],
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
                            widget.slist[ind][2],
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
            slider(),
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
                          // onPressed: null,
                          onPressed: ind == widget.slist.length
                              ? null
                              : () => {
                                    assetsAudioPlayer.stop(),
                                    setState(() {
                                      ind = ind + 1;
                                      noti();
                                      _isplaying = true;
                                    }),
                                  },
                        ),
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
                          onPressed: ind == 0
                              ? null
                              : () => {
                                    assetsAudioPlayer.stop(),
                                    setState(() {
                                      ind = ind - 1;
                                      noti();
                                      _isplaying = true;
                                    }),
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
                          icon: Icon(
                            _isplaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: audio,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: ind == widget.slist.length - 1
                          ? Colors.grey
                          : Colors.white,
                      child: Center(
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(
                            Icons.skip_next,
                            color: Colors.black,
                          ),
                          onPressed: ind == widget.slist.length - 1
                              ? null
                              : () => {
                                    assetsAudioPlayer.stop(),
                                    setState(() {
                                      ind = ind + 1;
                                      noti();
                                      _isplaying = true;
                                    }),
                                  },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black,
                      // backgroundColor: ind == 0 ? Colors.grey : Colors.white,
                      child: Center(
                        child: IconButton(
                          // color: Colors.white,
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
