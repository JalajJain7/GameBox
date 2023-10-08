// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import '../FlappyBird/theme.dart';
import 'package:flutter/material.dart';

import 'data/data.dart';

var alreadySelected = [];

class MemoryGame extends StatefulWidget {
  const MemoryGame({super.key});

  @override
  State<MemoryGame> createState() => _HomePageState();
}

class _HomePageState extends State<MemoryGame> {
  @override
  void initState() {
    super.initState();
    pairs = getPairs();
    pairs.shuffle();
    points = 0;
    visiblePairs = pairs;
    selcted = true;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        visiblePairs = getBlanks();
        selcted = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundColour,
      appBar: AppBar(
        title: const Text("Memory Game"),
        backgroundColor: MyTheme.backgroundColour,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: points != 1000
            ? Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$points/1000",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: MyTheme.whitecolour,
                    ),
                  ),
                  const Text(
                    "Points",
                    style: TextStyle(color: MyTheme.whitecolour),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 0.0,
                      maxCrossAxisExtent: 100,
                    ),
                    children: List.generate(visiblePairs.length, (index) {
                      return Tile(
                        imageAssetPath: visiblePairs[index].getImageAssetPath(),
                        selected: visiblePairs[index].getIsSelected(),
                        parent: this,
                        tileIndex: index,
                      );
                    }),
                  ),
                ],
              )
            : AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                title: const Text(
                  'CONGRATULATIONS!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: const Text(
                  'You seem to have a sharp memory!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      points = 0;
                      alreadySelected = [];
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: MyTheme.backgroundColour,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Tile extends StatefulWidget {
  String imageAssetPath = "";
  bool selected;
  int tileIndex;
  _HomePageState parent;
  Tile(
      {super.key,
      required this.imageAssetPath,
      required this.selected,
      required this.parent,
      required this.tileIndex});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (alreadySelected.contains(widget.tileIndex)) {
          return;
        }
        if (!selcted) {
          if (selectedImageAssetPath != "") {
            if (selectedImageAssetPath ==
                pairs[widget.tileIndex].getImageAssetPath()) {
              //correct
              // print("correct");

              selcted = true;
              Future.delayed(const Duration(milliseconds: 300), () {
                selcted = false;
                points = points + 100;
                alreadySelected.addAll([widget.tileIndex, selectedTileIndex]);
                setState(() {});
                widget.parent.setState(() {});
              });
            } else {
              //wrong
              // print("wrong");
              selcted = true;
              Future.delayed(const Duration(seconds: 1), () {
                selcted = false;
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setIsSelected(false);
                  pairs[selectedTileIndex].setIsSelected(false);
                });
              });
            }
            selectedImageAssetPath = "";
          } else {
            selectedTileIndex = widget.tileIndex;
            selectedImageAssetPath =
                pairs[widget.tileIndex].getImageAssetPath();
          }
          setState(() {
            pairs[widget.tileIndex].setIsSelected(true);
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Image.asset(pairs[widget.tileIndex].getIsSelected()
            ? pairs[widget.tileIndex].getImageAssetPath()
            : widget.imageAssetPath),
      ),
    );
  }
}
