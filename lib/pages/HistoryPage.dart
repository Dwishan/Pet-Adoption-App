import 'package:flutter/material.dart';
import 'package:pet_adoption_app/model/PetProvider.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // List<Pet> adoptedPets = [];

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();
    var adoptedPets = Provider.of<PetProvider>(context).adoptedPets;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'A D O P T E D 🐾 P E T S',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: null,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: petProvider.adoptedPets.length,
        itemBuilder: (context, index) {
          final pet = adoptedPets[index];
          return Dismissible(
            key: Key(pet.name),
            onDismissed: (direction) {
              // Remove the pet from the list of adopted pets when dismissed
              petProvider.removeAdoptedPet(pet);
            },
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete),
            ),
            child: GestureDetector(
              onTap: () {
                petProvider.removeAdoptedPet(pet);
              },
              child: Card(
                elevation: 8,
                shadowColor: Theme.of(context).colorScheme.background,
                margin: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      title: Text(
                        pet.name,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        pet.category,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(pet.imageUrl),
                      )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
