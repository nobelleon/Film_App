import 'package:film_app/gudang/gudang_film.dart';
import 'package:film_app/model/respon_film.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/subjects.dart';

class FilmsListByGenreBloc {
  final GudangFilm _gudangFilm = GudangFilm();
  final BehaviorSubject<ResponFilm> _subject = BehaviorSubject<ResponFilm>();

  getFilmsByGenre(int id) async {
    ResponFilm response = await _gudangFilm.getFilmsByGenre(id);
    _subject.sink.add(response);
  }

  void drainStream() async {
    await _subject.drain();
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ResponFilm> get subject => _subject;
}

final filmsByGenreBloc = FilmsListByGenreBloc();
