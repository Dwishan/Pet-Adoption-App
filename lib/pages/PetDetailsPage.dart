import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/model/Pet.dart';
import 'package:pet_adoption_app/model/PetProvider.dart';
import 'package:pet_adoption_app/pages/HomePage.dart';
import 'package:provider/provider.dart';

class PetDetailsPage extends StatefulWidget {
  final Pet pet;
  const PetDetailsPage({
    super.key,
    required this.pet,
  });

  @override
  State<PetDetailsPage> createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends State<PetDetailsPage> {
  List<Pet> adoptedPets = [];

  late ConfettiController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 3));
    _controller.addListener(() {
      setState(() {
        isPlaying = _controller.state == ConfettiControllerState.playing;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final adoptionBloc = BlocProvider.of<AdoptionBloc>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: ConfettiWidget(
                emissionFrequency: 0.2,
                numberOfParticles: 20,
                confettiController: _controller,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: true,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.6,
                  ),
                  InteractiveViewer(
                    maxScale: 5.0,
                    minScale: 0.01,
                    child: Hero(
                      tag: widget.pet.imageUrl,
                      child: SafeArea(
                        child: Container(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 160,
                            backgroundImage: AssetImage(
                              widget.pet.imageUrl,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: size.height * 0.15,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.pet.name,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Text(
                                    "category: " + widget.pet.category,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(
                                    "age: " + widget.pet.age,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    "price: " + widget.pet.price,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.pet.description,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (context) {
              //         return AlertDialog(
              //           title: Text('Adoption Confirmation'),
              //           content: Text('You\'ve now adopted ${widget.pet.name}'),
              //           actions: [
              //             TextButton(
              //               onPressed: () {
              //                 Provider.of<PetProvider>(context, listen: false)
              //                     .addToAdoptedPets(widget.pet);
              //                 widget.pet.isAdopted = true;
              //                 Navigator.pop(context); // Close dialog
              //                 Navigator.pop(context); // Navigate back to Home Page
              //               },
              //               child: Text('OK'),
              //             ),
              //           ],
              //         );
              //       },
              //     );
              //   },
              //   child: Text('Adopt Me'),
              // ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      title: Text(
                        "Adoptation Confirmation",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      content: Text(
                        "${widget.pet.name}" + " is successfully adopted",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        Center(
                          child: TextButton(
                            onPressed: () async {
                              // Provider.of<PetProvider>(context, listen: false)
                              //     .addToAdoptedPets(widget.pet);
                              // widget.pet.isAdopted = true;
                              // widget.onAdopted(true);
                              if (isPlaying) {
                                _controller.play();
                              } else {
                                _controller.stop();
                              }
                              setState(() {
                                widget.pet.isAdopted = true;
                              });

                              final petProvider = context.read<PetProvider>();
                              petProvider.addAdoptedPet(widget.pet);
                              await petProvider.saveAdoptedPets();
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            },
                            child: Text(
                              "OK",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Adopt Me!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
