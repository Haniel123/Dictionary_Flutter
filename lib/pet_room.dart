import 'package:flutter/material.dart';

import 'models/pet.dart';
import 'pet_details.dart';

class PetRoom extends StatelessWidget {
  final Pet pet;

  const PetRoom({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(pet.name),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: PetDetail(pet: pet),
      ),
    );
  }
}
