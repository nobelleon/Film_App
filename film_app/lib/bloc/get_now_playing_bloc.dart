import 'package:film_app/gudang/gudang_film.dart';
import 'package:film_app/model/respon_film.dart';
import 'package:rxdart/rxdart.dart';

class NowPlayingListBloc {
  final GudangFilm _gudangFilm = GudangFilm();
  final BehaviorSubject<ResponFilm> _subject = BehaviorSubject<ResponFilm>();

  getFilms() async {
    ResponFilm response = await _gudangFilm.getPlayingMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ResponFilm> get subject => _subject;
}

final nowPlayingFilmsBloc = NowPlayingListBloc();
