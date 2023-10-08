import 'package:flutter/material.dart';
import 'dart:math';
import '../Snake/theme.dart';

class DiceGame extends StatefulWidget {
  @override
  State<DiceGame> createState() => _homescreenState();
}

int count = 0;
int user1Score = 0;
int user2Score = 0;
int leftDiceNumber = 2;
int rightDiceNumber = 1;
int chance = 1;
Color buttonColor = MyTheme.yellowcolor;
Color fontColor = Colors.black;
void init() {
  user1Score = 0;
  user2Score = 0;
  buttonColor = MyTheme.yellowcolor;
  fontColor = Colors.black;
  chance = 1;
  count = 0;
}

class _homescreenState extends State<DiceGame>
    with SingleTickerProviderStateMixin {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  late AnimationController _controller;
  late CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    init();
    animate();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  animate() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    animation.addListener(() {
      setState(() {});
      // print(_controller.value);
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          leftDiceNumber = Random().nextInt(6) + 1;
          rightDiceNumber = Random().nextInt(6) + 1;
          if (chance == 1) {
            user1Score += leftDiceNumber + rightDiceNumber;
            chance = 2;
          } else {
            user2Score += leftDiceNumber + rightDiceNumber;
            chance = 1;
            count++;
          }
        });
        // print('Completed');
        _controller.reverse();
      }
    });
  }

  void roll() {
    _controller.forward();
  }

  void score_updation() {
    // if (chance == 1) {
    //   user1Score += leftDiceNumber + rightDiceNumber;
    //   chance = 2;
    // } else {
    //   user2Score += leftDiceNumber + rightDiceNumber;
    //   chance = 1;
    //   count++;
    // }
    if (count == 5) {
      var drawCheck = user1Score != user2Score;
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: MyTheme.backgroundColour,
            title: const Text(
              'Game Over',
              style: TextStyle(color: MyTheme.whitecolour),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  drawCheck
                      ? Text(
                          'Winner is Player ${user1Score > user2Score ? 1 : 2}',
                          style: const TextStyle(color: MyTheme.whitecolour),
                        )
                      : const Text(
                          'Draw',
                          style: TextStyle(color: MyTheme.whitecolour),
                        ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Restart',
                    style: TextStyle(color: MyTheme.yellowcolor)),
                onPressed: () {
                  init();
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    buttonColor = chance == 2 ? MyTheme.yellowcolor : MyTheme.snake;
    fontColor = chance == 2 ? Colors.black : MyTheme.whitecolour;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundColour,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyTheme.backgroundColour,
        title: const Text(
          'ROLL THE DICE',
          style: TextStyle(
              color: MyTheme.yellowcolor, fontWeight: FontWeight.w900),
        ),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: () {
                      roll();
                    },
                    child: SizedBox(
                      width: 100,
                      child: Image(
                          // width: MediaQuery.of(context).size.width / 3 - (animation.value) * 200),
                          height: MediaQuery.of(context).size.width / 2.5 -
                              (animation.value) *
                                  MediaQuery.of(context).size.width /
                                  2.5,
                          image: AssetImage(
                              'assets/images/dice$leftDiceNumber.png')),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: () {
                      roll();
                    },
                    child: Image(
                        //width: 150.0,
                        height: MediaQuery.of(context).size.width / 2.5 -
                            (animation.value) *
                                MediaQuery.of(context).size.width /
                                2.5,
                        image: AssetImage(
                            'assets/images/dice$rightDiceNumber.png')),
                  ),
                )
              ],
            ),
            const Spacer(),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: MyTheme.yellowcolor,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundImage:
                              AssetImage('assets/images/user1.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "SCORE:  $user1Score",
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    color: buttonColor,
                    onPressed: () {
                      roll();

                      score_updation();
                    },
                    child: Text(
                      'ROLL',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: fontColor),
                    ),
                  ),
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: MyTheme.snake,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundImage:
                              AssetImage('assets/images/user1.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "SCORE:  $user2Score",
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
