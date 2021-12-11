
import 'package:cloud_firestore/cloud_firestore.dart';

class Vaccination {
  final String vaccination;
  final DateTime date;
  bool? done;

  Vaccination(this.vaccination,
      {required this.date, this.done});

  factory Vaccination.fromJson(Map<String, dynamic> json) =>
      _vaccinationFromJson(json);

  Map<String, dynamic> toJson() => _vaccinationToJson(this);

  @override
  String toString() => 'Vaccination<$vaccination>';
}

Vaccination _vaccinationFromJson(Map<String, dynamic> json) {
  return Vaccination(
    json['vaccination'] as String,
    date: (json['date'] as Timestamp).toDate(),
    done: json['done'] as bool,
  );
}

Map<String, dynamic> _vaccinationToJson(Vaccination instance) =>
    <String, dynamic>{
      'vaccination': instance.vaccination,
      'date': instance.date,
      'done': instance.done,
    };
