// ignore_for_file: prefer_const_constructors

import 'package:flame/game.dart';
import 'package:flappy_bird/FlappyBird/flappy_bird_game.dart';
import 'package:flappy_bird/FlappyBird/theme.dart';

import 'package:flutter/material.dart';

import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './menu.dart';

ValueNotifier<bool> gameOverCheck = ValueNotifier<bool>(false);

ValueNotifier<int> i = ValueNotifier<int>(0);

class FlappyBirdScreen extends StatefulWidget {
  const FlappyBirdScreen({
    super.key,
  });

  @override
  State<FlappyBirdScreen> createState() => _FlappyBirdScreenState();
}

class _FlappyBirdScreenState extends State<FlappyBirdScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    gameOverCheck.value = false;
    i.value = 0;
  }

  void showDialogBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: const Text('Do you want to play again?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => super.widget),
                );
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    FlappyBirdGame gameScreen = FlappyBirdGame();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 209, 131),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GameWidget(
                game: gameScreen,
              ),
            ),
            MultiValueListenableBuilder(
                valueListenables: [i, gameOverCheck],
                builder: (context, values, _) {
                  return Container(
                    decoration: BoxDecoration(
                      color: MyTheme.backgroundColour,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    height: 100,
                    width: double.infinity,
                    child: Center(
                      child: values.elementAt(1)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Score: ${values.elementAt(0)}",
                                  style: const TextStyle(
                                    color: MyTheme.whitecolour,
                                    fontSize: 40,
                                  ),
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: MyTheme.whitecolour,
                                  onPressed: () {
                                    // scoreSolve();
                                    // Refresh this page
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                super.widget));
                                  },
                                  child: const Text('Play Again'),
                                ),
                              ],
                            )
                          : Text(
                              'Score: ${values.elementAt(0)}',
                              style: TextStyle(
                                color: MyTheme.whitecolour,
                                fontSize: 40,
                              ),
                            ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  void scoreSolve() async {
    if (i.value > highScore) {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setInt('flappyHighScore', i.value);
    }
  }
}
