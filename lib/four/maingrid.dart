import 'package:flappy_bird/four/theme.dart';

import 'package:flutter/material.dart';

import 'initial.dart';

class mainGrid extends StatefulWidget {
  const mainGrid({super.key});

  @override
  State<mainGrid> createState() => _mainGridState();
}

class _mainGridState extends State<mainGrid> {
  bool checkWin(arr, index) {
    bool c = false;
    if (arr.contains(index + 7) &&
        arr.contains(index + 14) &&
        arr.contains(index + 21)) {
      c = true;
    } else if (index % 7 >= 3 &&
        arr.contains(index - 1) &&
        arr.contains(index - 2) &&
        arr.contains(index - 3)) {
      c = true;
    } else if (index % 7 <= 3 &&
        arr.contains(index + 1) &&
        arr.contains(index + 2) &&
        arr.contains(index + 3)) {
      c = true;
    } else if (index % 7 <= 3 &&
        arr.contains(index - 6) &&
        arr.contains(index - 12) &&
        arr.contains(index - 18)) {
      c = true;
    } else if (index % 7 >= 3 &&
        arr.contains(index + 6) &&
        arr.contains(index + 12) &&
        arr.contains(index + 18)) {
      c = true;
    } else if (index % 7 >= 3 &&
        arr.contains(index - 8) &&
        arr.contains(index - 16) &&
        arr.contains(index - 24)) {
      c = true;
    } else if (index % 7 <= 3 &&
        arr.contains(index + 8) &&
        arr.contains(index + 16) &&
        arr.contains(index + 24)) {
      c = true;
    }
    //hjshsjh
    else if (index % 7 >= 1 &&
        index % 7 <= 4 &&
        arr.contains(index - 1) &&
        arr.contains(index + 1) &&
        arr.contains(index + 2)) {
      c = true;
    } else if (index % 7 >= 2 &&
        index % 7 <= 5 &&
        arr.contains(index + 1) &&
        arr.contains(index - 1) &&
        arr.contains(index - 2)) {
      c = true;
    } else if (index % 7 >= 1 &&
        index % 7 <= 4 &&
        arr.contains(index - 6) &&
        arr.contains(index - 12) &&
        arr.contains(index + 6)) {
      c = true;
    } else if (index % 7 >= 2 &&
        index % 7 <= 5 &&
        arr.contains(index + 6) &&
        arr.contains(index + 12) &&
        arr.contains(index - 6)) {
      c = true;
    } else if (index % 7 >= 1 &&
        index % 7 <= 4 &&
        arr.contains(index - 8) &&
        arr.contains(index + 16) &&
        arr.contains(index + 8)) {
      c = true;
    } else if (index % 7 >= 2 &&
        index % 7 <= 5 &&
        arr.contains(index + 8) &&
        arr.contains(index - 16) &&
        arr.contains(index - 8)) {
      c = true;
    }

    return c;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
        color: chance ? MyTheme.yellowcolor : MyTheme.pinkcolor,
        width: 3,
      )),
      child: Center(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemCount: 42,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (chance) {
                  index = mainstorage[index % 7][0];

                  player1_storage.add(index);
                  mainstorage[index % 7].removeAt(0);
                  chance = false;

                  player1_won = checkWin(player1_storage, index);
                } else {
                  index = mainstorage[index % 7][0];
                  player2_storage.add(index);
                  mainstorage[index % 7].removeAt(0);
                  chance = true;
                  player2_won = checkWin(player2_storage, index);
                }
                setState(() {});

                if (player1_won) {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      backgroundColor: MyTheme.backgroundColour,
                      title: const Text(
                        "YAAY ",
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Text("$player1  won the game",
                          style: const TextStyle(color: Colors.white)),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            init();
                            setState(() {});
                          },
                          child: Container(
                            color: MyTheme.whitecolour,
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
                }
                if (player2_won) {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      backgroundColor: MyTheme.backgroundColour,
                      title: const Text(
                        "YAAY ",
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Text("$player2  won the game",
                          style: const TextStyle(color: Colors.white)),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            init();
                            setState(() {});
                          },
                          child: Container(
                            color: MyTheme.whitecolour,
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
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 11,
                color: MyTheme.backgroundColour,
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: player1_storage.contains(index)
                        ? MyTheme.yellowcolor
                        : player2_storage.contains(index)
                            ? MyTheme.pinkcolor
                            : MyTheme.whitecolour,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width / 12),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
