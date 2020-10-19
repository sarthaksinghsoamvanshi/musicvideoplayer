import 'package:flutter/material.dart';
// import 'package:videoaudio/homepage.dart';
// import 'package:videoaudio/listcomponents/artists.dart';
import 'package:videoaudio/smallcomponents/songpage.dart';

class ArtistPage extends StatelessWidget {
  final fname;
  final fslist;
  final fimage;

  // final productDOldprice;

  const ArtistPage({
    this.fname,
    this.fslist,
    this.fimage,
  });

  @override
  Widget build(BuildContext context) {
    var col1 = Colors.black;
    var col2 = Colors.white;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: col1,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: col1,
        ),
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               backgroundColor: Colors.black,
//               expandedHeight: 300,
//               flexibleSpace: Container(
//                 width: double.infinity,
//                 child: Image.asset(
//                   fimage,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             ListView.builder(
//                 itemCount: fslist.length,
//                 itemBuilder: (BuildContext context, index) {
//                   return SongCard(
//                     name: fslist[index][0],
//                     song: fslist[index][1],
//                     image: fimage,
//                     singer: fname,
//                   );
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }

        body: Stack(
          children: <Widget>[
            // Image.asset("images/sar.jpg"),

            Container(
              height: double.infinity,
              margin: EdgeInsets.only(top: 100),
              child: ListView.builder(
                itemCount: fslist.length,
                itemBuilder: (BuildContext context, index) {
                  return SongCard(
                    sglist: fslist,
                    index: index,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                // height: 40,
                margin: EdgeInsets.only(bottom: 20, left: 60),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                        maxRadius: 40, backgroundImage: AssetImage(fimage)),
                    SizedBox(width: 20),
                    Container(
                      width: 200,
                      child: Text(
                        fname,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        softWrap: true,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//         body: ListView(
//           renderPlayers(players) {
//   return Row(children: players.map((player) =>
//       Flexible(
//         child: PlayerCard(
//           player: player,
//       ),
//     )
//   ).toList());
// }

class SongCard extends StatelessWidget {
  final sglist;
  final index;
  const SongCard({this.sglist, this.index});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        sglist[index][0],
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text("Singer: ${sglist[index][2]}",
          style: TextStyle(color: Colors.white)),
      leading: Container(
        height: 45,
        width: 45,
        child: Image.asset(
          sglist[index][3],
          fit: BoxFit.cover,
        ),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SongPage(
            // songname: sglist[index][1],
            // singer1: sglist[index][2],
            // textname: sglist[index][0],
            // image1: sglist[index][3],
            slist: sglist,
            type: 0,
            index: index,
          ),
        ),
      ),
    );
  }
}
