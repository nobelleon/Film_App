import 'package:film_app/widgets/films_by_genre.dart';
import 'package:flutter/material.dart';
import 'package:film_app/bloc/get_films_byGenre_bloc.dart';
import 'package:film_app/model/aliran.dart';
import 'package:film_app/style/warna.dart' as Style;

class GenresList extends StatefulWidget {
  final List<Aliran> genres;
  GenresList({Key key, @required this.genres}) : super(key: key);

  @override
  _GenresListState createState() => _GenresListState(genres);
}

class _GenresListState extends State<GenresList>
    with SingleTickerProviderStateMixin {
  final List<Aliran> genres;
  TabController _tabController;
  _GenresListState(this.genres);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: genres.length);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        filmsByGenreBloc..drainStream();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 307.0,
      child: DefaultTabController(
        length: genres.length,
        child: Scaffold(
          backgroundColor: Style.Warna.fourthColor, // mainColor
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              backgroundColor: Style.Warna.fourthColor, // .mainColor
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Style.Warna.thirdColor, // secondColor
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3.0,
                unselectedLabelColor: Style.Warna.titleColor,
                labelColor: Colors.white,
                isScrollable: true,
                tabs: genres.map((Aliran genre) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
                    child: new Text(
                      genre.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: genres.map((Aliran genre) {
              return FilmByGenre(
                genreId: genre.id,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
