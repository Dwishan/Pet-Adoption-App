import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pet_adoption_app/model/Pet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetProvider extends ChangeNotifier {
  List<Pet> _adoptedPets = [];

  List<Pet> get adoptedPets => _adoptedPets;

  void addToAdoptedPets(Pet pet) {
    _adoptedPets.add(pet);
    notifyListeners();
  }

  void addAdoptedPet(Pet pet) {
    _adoptedPets.add(pet);
    notifyListeners();
  }

  void removeAdoptedPet(Pet pet) {
    _adoptedPets.remove(pet);
    notifyListeners();
  }

  void removeAdoptedPetByIndex(int index) {
    _adoptedPets.removeAt(index);
    notifyListeners();
  }

  Future<void> loadAdoptedPets() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? adoptedPetData = prefs.getStringList('adoptedPets');
    if (adoptedPetData != null) {
      _adoptedPets = adoptedPetData.map((petData) {
        Map<String, dynamic> json = jsonDecode(petData);
        return Pet(
          name: json['name'],
          age: json['age'],
          price: json['price'],
          category: json['category'] ?? '',
          imageUrl: json['imageUrl'] ?? '',
          description: json['description'] ?? '',
          isAdopted: false,
        );
      }).toList();
      notifyListeners();
    }
  }

  Future<void> saveAdoptedPets() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> adoptedPetData = _adoptedPets.map((pet) {
      Map<String, dynamic> json = {
        'name': pet.name,
        'age': pet.age,
        'price': pet.price,
        'image': pet.imageUrl,
        'description': pet.description,
      };
      return jsonEncode(json);
    }).toList();
    await prefs.setStringList('adoptedPets', adoptedPetData);
  }
}
