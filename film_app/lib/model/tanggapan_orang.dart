import 'package:film_app/model/person.dart';

class TanggapanOrang {
  final List<Person> persons;
  final String error;

  TanggapanOrang(this.persons, this.error);

  TanggapanOrang.fromJson(Map<String, dynamic> json)
      : persons = (json["results"] as List)
            .map((i) => new Person.fromJson(i))
            .toList(),
        error = "";

  TanggapanOrang.withError(String errorValue)
      : persons = [],
        error = errorValue;
}
