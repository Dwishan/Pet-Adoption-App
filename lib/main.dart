import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/bloc/AdoptBloc.dart';
import 'package:pet_adoption_app/model/PetProvider.dart';
import 'package:pet_adoption_app/pages/SplashPage.dart';
import 'package:pet_adoption_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final petProvider = PetProvider();
  await petProvider.loadAdoptedPets();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AdoptionBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => PetProvider()),
          ChangeNotifierProvider(create: (_) => petProvider),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
