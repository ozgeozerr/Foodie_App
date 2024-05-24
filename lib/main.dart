import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();


    runApp(const MyApp());
    //git buradan
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Foodie Recipe App",

      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}

