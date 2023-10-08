import 'package:flappy_bird/FlappyBird/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
bool vibrateCheck = true;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const SizedBox(height: 20),
        // ignore: prefer_const_constructors
        Center(
          child: const Text(
            "Settings",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: MyTheme.whitecolour),
          ),
        ),
        const SizedBox(height: 20),
        const Divider(
          color: MyTheme.whitecolour,
          thickness: 4,
          indent: 20,
          endIndent: 20,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Vibration ",
                      style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: MyTheme.whitecolour,
                        ),
                      ),
                    ),
                    Switch(
                      // thumb color (round icon)
                      activeColor: MyTheme.player2Colour,
                      activeTrackColor: MyTheme.player1Colour,
                      inactiveThumbColor: Colors.blueGrey.shade600,
                      inactiveTrackColor: Colors.grey.shade400,
                      splashRadius: 50.0,
                      // boolean variable value
                      value: vibrateCheck,
                      // changes the state of the switch
                      onChanged: (value) {
                        vibrateCheck = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
