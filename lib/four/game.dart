import 'package:flappy_bird/four/maingrid.dart';
import 'package:flappy_bird/four/player.dart';
import 'package:flappy_bird/four/theme.dart';
import 'package:flutter/material.dart';

import 'initial.dart';

class fourConnect extends StatefulWidget {
  const fourConnect({super.key});

  @override
  State<fourConnect> createState() => _DieGameState();
}

class _DieGameState extends State<fourConnect> {
  @override
  void initState() {
    super.initState();

    init();
    setState(() {});
  }

  void setinit() {
    init();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.backgroundColour,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyTheme.backgroundColour,
          title: const Text("Four In A Row "),
        ),
        body: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            const mainGrid(),
            const Spacer(
              flex: 3,
            ),
            player(onpress: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    maintainState: false,
                    builder: (BuildContext context) => super.widget),
              );
            }),
            const Spacer(
              flex: 1,
            ),
          ],
        ));
  }
}
