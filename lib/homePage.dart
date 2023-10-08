import 'package:flappy_bird/FlappyBird/theme.dart';
import 'package:flappy_bird/aboutpage.dart';
import 'package:flappy_bird/gameMenu.dart';
import 'package:flappy_bird/settings.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final prefs;

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  Widget widgetForBody = const GameMenu();

  @override
  void initState() {
    super.initState();
    inti();
  }

  void inti() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundColour,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: MyTheme.player1Colour,
              ),
              child: Center(
                  child: Text(
                'GameBox',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
            ),
            ListTile(
              title: const Text('Game Menu'),
              onTap: () {
                setState(() {
                  widgetForBody = const GameMenu();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                setState(() {
                  widgetForBody = const Settings();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                setState(() {
                  widgetForBody = const About();
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("GameBox"),
        backgroundColor: MyTheme.player1Colour,
        foregroundColor: Colors.black,
      ),
      body: widgetForBody,
    );
  }
}
