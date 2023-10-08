import 'package:flappy_bird/FlappyBird/theme.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

var highScore = 0;

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
    score();
  }

  void score() async {
    var prefs = await SharedPreferences.getInstance();

    highScore = prefs.getInt('flappyHighScore') ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundColour,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          score();
                        },
                        icon: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Refresh Score",
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            color: MyTheme.whitecolour,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            const Spacer(),
            Text(
              'Flappy Bird',
              // style: TextStyle(
              //   // fontStyle: GoogleFonts.lato().fontStyle,
              //   color: MyTheme.whitecolour,
              //   fontSize: 50,
              // ),
              style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                  color: MyTheme.whitecolour,
                  fontSize: 50,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'High Score: $highScore',
              style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                  color: MyTheme.whitecolour,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: MyTheme.player1Colour,
              onPressed: () {
                Navigator.of(context).pushNamed('/FlappyGame');
              },
              child: const Text(
                'Play',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Spacer(),
            // const SafeArea(
            //   child: Text(
            //     'Made by: Jalaj Jain',
            //     style: TextStyle(
            //       color: MyTheme.whitecolour,
            //       fontSize: 10,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
