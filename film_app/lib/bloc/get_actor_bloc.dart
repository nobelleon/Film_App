import 'package:film_app/gudang/gudang_film.dart';
import 'package:film_app/model/respon_pemeran.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class ActorsBloc {
  final GudangFilm _gudangFilm = GudangFilm();
  final BehaviorSubject<ResponPemeran> _subject =
      BehaviorSubject<ResponPemeran>();

  getActors(int id) async {
    ResponPemeran response = await _gudangFilm.getActors(id);
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

  BehaviorSubject<ResponPemeran> get subject => _subject;
}

final actorsBloc = ActorsBloc();
