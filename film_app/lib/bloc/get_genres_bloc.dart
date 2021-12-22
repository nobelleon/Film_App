import 'package:film_app/gudang/gudang_film.dart';
import 'package:film_app/model/respon_aliran.dart';
import 'package:rxdart/subjects.dart';

class GenresListBloc {
  final GudangFilm _gudangFilm = GudangFilm();
  final BehaviorSubject<ResponAliran> _subject =
      BehaviorSubject<ResponAliran>();

  getGenres() async {
    ResponAliran response = await _gudangFilm.getGenres();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ResponAliran> get subject => _subject;
}

final genresBloc = GenresListBloc();
