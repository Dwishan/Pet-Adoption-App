import 'package:flutter/material.dart';
import 'package:pet_adoption_app/auth/LoginOrRegisterPage.dart';
import 'package:pet_adoption_app/components/DrawerTile.dart';
import 'package:pet_adoption_app/model/Pet.dart';
import 'package:pet_adoption_app/pages/HistoryPage.dart';
import 'package:pet_adoption_app/pages/PetDetailsPage.dart';
import 'package:pet_adoption_app/pages/SettingsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = [
    "Dogs",
    "Cats",
    "Birds",
    "Fish",
  ];

  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    final filterProducts = petList.where((pet) {
      return selectedCategories.isEmpty ||
          selectedCategories.contains(pet.category);
    }).toList();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          "P E T 🐾 A D O P T I O N",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        centerTitle: true,
        leading: null,
        actions: [
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Icon(
              Icons.pets_rounded,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.pets_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DrawerTile(
              title: "Settings",
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
            ),
            DrawerTile(
              title: "History",
              leading: Icon(
                Icons.history,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryPage(),
                  ),
                );
              },
            ),
            DrawerTile(
              title: "Logout",
              leading: Icon(
                Icons.logout_rounded,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginOrRegister(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              // width: double.infinity,
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              // margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                // borderRadius: const BorderRadius.vertical(
                //   top: Radius.circular(30),
                // ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Search pet to adopt...",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.w600,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.primary,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: categories
                            .map(
                              (category) => Row(
                                children: [
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  FilterChip(
                                      checkmarkColor: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      side: BorderSide.none,
                                      labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                      ),
                                      selected:
                                          selectedCategories.contains(category),
                                      label: Text(category),
                                      onSelected: (selected) {
                                        setState(() {
                                          if (selected) {
                                            selectedCategories.add(category);
                                          } else {
                                            selectedCategories.remove(category);
                                          }
                                        });
                                      }),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: filterProducts.length,
                        itemBuilder: (context, index) {
                          final pet = filterProducts[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PetDetailsPage(
                                    pet: pet,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 8,
                              shadowColor:
                                  Theme.of(context).colorScheme.secondary,
                              margin: const EdgeInsets.only(
                                  left: 12, right: 12, bottom: 14),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: pet.isAdopted
                                      ? Color.fromRGBO(85, 37, 127, 0.875)
                                      : Theme.of(context).colorScheme.primary,
                                ),
                                child: ListTile(
                                  leading: Hero(
                                    tag: pet.imageUrl,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: AssetImage(pet.imageUrl),
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  title: Text(
                                    pet.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: pet.isAdopted
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                    ),
                                  ),
                                  subtitle: Text(
                                    pet.category,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: pet.isAdopted
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                    ),
                                  ),
                                  trailing: pet.isAdopted
                                      ? Text(
                                          "Already Adopted",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                        )
                                      : Text(""),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
