import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/pet.dart';

class DataReponsitory {
  
  final CollectionReference colection =
      FirebaseFirestore.instance.collection('pet');
  Stream<QuerySnapshot> getStream() {
    return colection.snapshots();
  }
 
  Future<DocumentReference> addPet(Pet pet) {
    return colection.add(pet.toJson());
  }

  void updatePet(Pet pet) async {
    await colection.doc(pet.referenceId.toString()).update(pet.toJson());
  }

  void deletePet(Pet pet) async {
      await colection.doc(pet.referenceId.toString()).delete();
  }
}
