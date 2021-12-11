
import 'package:cloud_firestore/cloud_firestore.dart';
import 'vaccination.dart';

class Pet {
  String name;
  String? notes;
  String type;
  List<Vaccination> vaccinations;
  String? referenceId;

  Pet(this.name,
      {this.notes,
      required this.type,
      this.referenceId,
      required this.vaccinations});

  factory Pet.fromSnapshot(DocumentSnapshot snapshot) {
    final newPet = Pet.fromJson(snapshot.data() as Map<String, dynamic>);
    newPet.referenceId = snapshot.reference.id;
    return newPet;
  }

  factory Pet.fromJson(Map<String, dynamic> json) => _petFromJson(json);

  Map<String, dynamic> toJson() => _petToJson(this);

  @override
  String toString() => 'Pet<$name>';
}

Pet _petFromJson(Map<String, dynamic> json) {
  return Pet(json['name'] as String,
      notes: json['notes'] as String?,
      type: json['type'] as String,
      vaccinations:
          _convertVaccinations(json['vaccinations'] as List<dynamic>));
}

List<Vaccination> _convertVaccinations(List<dynamic> vaccinationMap) {
  final vaccinations = <Vaccination>[];

  for (final vaccination in vaccinationMap) {
    vaccinations.add(Vaccination.fromJson(vaccination as Map<String, dynamic>));
  }
  return vaccinations;
}

Map<String, dynamic> _petToJson(Pet instance) => <String, dynamic>{
      'name': instance.name,
      'notes': instance.notes,
      'type': instance.type,
      'vaccinations': _vaccinationList(instance.vaccinations),
    };

List<Map<String, dynamic>>? _vaccinationList(List<Vaccination>? vaccinations) {
  if (vaccinations == null) {
    return null;
  }
  final vaccinationMap = <Map<String, dynamic>>[];
  vaccinations.forEach((vaccination) {
    vaccinationMap.add(vaccination.toJson());
  });
  return vaccinationMap;
}
