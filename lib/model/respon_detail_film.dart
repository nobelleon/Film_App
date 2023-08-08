import 'package:film_app/model/detail_film.dart';

class ResponDetailFilm {
  final DetailFilm detailFilm;
  final String error;

  ResponDetailFilm(this.detailFilm, this.error);

  ResponDetailFilm.fromJson(Map<String, dynamic> json)
      : detailFilm = DetailFilm.fromJson(json),
        error = "";

  ResponDetailFilm.withError(String errorValue)
      : detailFilm = DetailFilm(null, null, null, null, null, "", null),
        error = errorValue;
}
