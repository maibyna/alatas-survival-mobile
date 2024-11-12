import 'package:flutter/material.dart';
import 'package:alatas_survival/screens/menu.dart';
import 'package:alatas_survival/screens/alentry_form.dart';
import 'package:alatas_survival/widgets/al_card.dart';
import 'package:alatas_survival/widgets/left_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alatas Survival App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan,).copyWith(secondary: Colors.cyan[50]),
        textTheme: GoogleFonts.cardoTextTheme( // Menetapkan text theme menggunakan font Cardo
            Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}


