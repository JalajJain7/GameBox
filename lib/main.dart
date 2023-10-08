import 'package:flappy_bird/FlappyBird/screen.dart';
import 'package:flappy_bird/paramita/mainfile.dart';
import 'package:flappy_bird/peace/main.dart';
import 'package:flappy_bird/sakshi/home_screen.dart';
import 'package:flappy_bird/sowmya/game.dart';

import 'package:flappy_bird/FlappyBird/menu.dart';
import 'package:flappy_bird/homePage.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Snake/game.dart';
import 'four/game.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.rubik().fontFamily),
      debugShowCheckedModeBanner: false,
      routes: {
        '/FlappyGame': (context) => const FlappyBirdScreen(),
        '/FlappyBirdMenu': (context) => const MainMenu(),
        '/snake': (context) => const HungrySnake(),
        '/rockpaper': (context) => const StonePaper(),
        '/tictaktoe': (context) => const HomeScreenTic(),
        '/memoryGame': (context) => const MemoryGame(),
        '/dice': (context) => DiceGame(),
        '/four': (context) => const fourConnect(),
      },
      home: const MainHomePage(),
    ),
  );
}
