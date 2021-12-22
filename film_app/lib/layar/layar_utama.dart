import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:film_app/model/person.dart';
import 'package:film_app/screens/CallScreen/call_screen.dart';
import 'package:film_app/widgets/film_terbaik.dart';
import 'package:film_app/widgets/layar_genre.dart';
import 'package:film_app/widgets/now_playing.dart';
import 'package:film_app/widgets/persons.dart';
import 'package:flutter/material.dart';
import 'package:film_app/style/warna.dart' as Style;

class LayarUtama extends StatefulWidget {
  @override
  _LayarUtamaState createState() => _LayarUtamaState();
}

class _LayarUtamaState extends State<LayarUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Warna.fourthColor, //mainColor
      appBar: AppBar(
        backgroundColor: Style.Warna.fourthColor,
        centerTitle: true,
        leading: Icon(
          EvaIcons.menu2Outline,
          color: Colors.white,
        ),
        title: Text("Film App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(EvaIcons.searchOutline, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(EvaIcons.phoneCall, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CallScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(), // ada di folder widgets
          LayarGenre(), // ada di folder widgets
          Persons(),
          FilmTerbaik(),
        ],
      ),
    );
  }
}
