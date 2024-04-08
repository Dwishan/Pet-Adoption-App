import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/model/Pet.dart';

abstract class AdoptionEvent {}

class AdoptPetEvent extends AdoptionEvent {
  final Pet pet;

  AdoptPetEvent(this.pet);
}

class AdoptionState {
  final List<Pet> adoptedPets;

  AdoptionState(this.adoptedPets);
}

class AdoptionBloc extends Bloc<AdoptionEvent, AdoptionState> {
  AdoptionBloc() : super(AdoptionState([]));

  Stream<AdoptionState> mapEventToState(AdoptionEvent event) async* {
    if (event is AdoptPetEvent) {
      final List<Pet> updatedPets = List.from(state.adoptedPets)
        ..add(event.pet);
      yield AdoptionState(updatedPets);
    }
  }
}
