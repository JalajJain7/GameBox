import 'dart:math';

import 'package:flappy_bird/Snake/theme.dart';
import 'package:flappy_bird/settings.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

enum Direction { left, right, up, down }

var arr = [0, 1, 2];
Direction dir = Direction.right;
int fruit = -1;
int score = 0;
bool started = false;
bool reset = true;

class HungrySnake extends StatefulWidget {
  const HungrySnake({super.key});

  @override
  State<HungrySnake> createState() => _HungrySnakeState();
}

class _HungrySnakeState extends State<HungrySnake> {
  void init() {
    arr = [0, 1, 2];
    dir = Direction.right;
    fruit = -1;
    score = 0;
    started = false;
    reset = true;
  }

  void fruitGenerator() {
    do {
      fruit = Random().nextInt(100);
    } while (arr.contains(fruit));
  }

  void solve() async {
    init();
    started = true;
    reset = false;
    setState(() {});
    fruitGenerator();
    int cnt = arr[arr.length - 1];

    while (true) {
      //   print("object2");

      switch (dir) {
        case Direction.left:
          if (cnt % 10 == 0) {
            cnt += 10;
          }
          cnt--;
          break;

        case Direction.right:
          if (cnt % 10 == 9) {
            cnt -= 10;
          }
          cnt++;
          break;

        case Direction.up:
          cnt -= 10;
          break;

        case Direction.down:
          cnt += 10;
          break;

        default:
      }

      if (cnt >= 100) cnt = cnt % 100;
      if (cnt < 0) {
        cnt += 100;
      }

      if (arr.contains(cnt)) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: MyTheme.backgroundColour,
            title: const Text(
              "Game Over",
              style: TextStyle(color: Colors.white),
            ),
            content: Text("You scored $score in the game",
                style: const TextStyle(color: Colors.white)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  score = 0;
                  setState(() {});
                  solve();
                },
                child: Container(
                  color: MyTheme.yellowcolor,
                  padding: const EdgeInsets.all(14),
                  child: const Text(
                    "Restart",
                    style: TextStyle(color: MyTheme.backgroundColour),
                  ),
                ),
              ),
            ],
          ),
        );
        break;
      }

      if (reset == true) {
        break;
      }

      arr.add(cnt);
      if (cnt != fruit) {
        arr.removeAt(0);
      } else {
        if (vibrateCheck) {
          Vibration.vibrate(duration: 200);
        }
        fruitGenerator();
        score = (arr.length - 3);
      }

      setState(() {});
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        int sensitivity = 1;

        if (details.delta.dy > sensitivity && dir != Direction.up) {
          //   print("down");
          dir = Direction.down;
        } else if (details.delta.dy < -sensitivity && dir != Direction.down) {
          //   print("up");
          dir = Direction.up;
        }
      },
      onHorizontalDragUpdate: (details) {
        int sensitivity = 1;

        if (details.delta.dx > sensitivity && dir != Direction.left) {
          //   print("right");
          dir = Direction.right;
        } else if (details.delta.dx < -sensitivity && dir != Direction.right) {
          //   print("left");
          dir = Direction.left;
        }
      },
      child: Scaffold(
        backgroundColor: MyTheme.backgroundColour,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyTheme.backgroundColour,
          title: const Text('Hungry Snake'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: Colors.white,
                ),
              ),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemBuilder: ((context, index) {
                  return Container(
                    padding: const EdgeInsets.all(3),
                    color: arr.contains(index)
                        ? MyTheme.snake
                        : MyTheme.backgroundColour,
                    child: index == fruit
                        ? const CircleAvatar(
                            radius: 10,
                            backgroundColor: MyTheme.yellowcolor,
                          )
                        : Container(
                            color: arr.contains(index)
                                ? MyTheme.snake
                                : MyTheme.backgroundColour,
                          ),
                  );
                }),
                itemCount: 100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    disabledColor: MyTheme.yellowcolor.withOpacity(0.5),
                    minWidth: MediaQuery.of(context).size.width / 2.5,
                    color: MyTheme.yellowcolor,
                    onPressed: started == false ? () => solve() : null,
                    child: const Text("start",
                        style: TextStyle(color: MyTheme.backgroundColour))),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width / 2.5,
                    color: MyTheme.yellowcolor,
                    child: const Text("reset",
                        style: TextStyle(color: MyTheme.backgroundColour)),
                    onPressed: () {
                      init();

                      setState(() {});
                    })
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "SCORE : $score",
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
