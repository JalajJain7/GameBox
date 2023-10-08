import 'package:flappy_bird/FlappyBird/theme.dart';
import 'package:flappy_bird/data.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final index;
  const CustomCard({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(ItemsForMenu[index]['image'].toString()),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                ItemsForMenu[index]['name'].toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: MyTheme.player1Colour,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(ItemsForMenu[index]['route'].toString());
                },
                child: const Text(
                  'Play',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
