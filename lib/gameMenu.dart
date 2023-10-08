import 'package:flappy_bird/cutomcard.dart';
import 'package:flappy_bird/data.dart';
import 'package:flutter/material.dart';

class GameMenu extends StatelessWidget {
  const GameMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ItemsForMenu.length,
      itemBuilder: (context, index) {
        return CustomCard(
          index: index,
        );
      },
    );
  }
}
