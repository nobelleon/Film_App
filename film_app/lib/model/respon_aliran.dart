import 'package:film_app/model/aliran.dart';

// Respon Genre
class ResponAliran {
  final List<Aliran> alirans;
  final String error;

  ResponAliran(this.alirans, this.error);

  ResponAliran.fromJson(Map<String, dynamic> json)
      : alirans = (json["genres"] as List)
            .map((i) => new Aliran.fromJson(i))
            .toList(),
        error = "";

  ResponAliran.withError(String errorValue)
      : alirans = [],
        error = errorValue;
}
