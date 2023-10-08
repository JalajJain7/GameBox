import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibration/vibration.dart';

import '../settings.dart';

class StonePaper extends StatefulWidget {
  const StonePaper({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<StonePaper> {
  String userChoice = '';
  String compChoice = '';
  String message = '';
  double myPoints = 0;
  bool hasChosen = false;
  List<String> _choices = ['paper', 'rock', 'scissors'];
  Widget iPicked = Container(), comPicked = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
            top: 30.0, left: 8.0, right: 8.0, bottom: 8.0),
        decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
          const HSLColor.fromAHSL(1, 214, 0.47, 0.23).toColor(),
          const HSLColor.fromAHSL(1, 239, 0.49, 0.15).toColor(),
        ])),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 3.0,
                      color: const HSLColor.fromAHSL(1, 217, 0.16, 0.45)
                          .toColor()),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Rock\nPaper\nScissors',
                    style: GoogleFonts.barlowSemiCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(100, 80)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: null,
                      child: RichText(
                          text: TextSpan(
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                              children: <TextSpan>[
                            TextSpan(
                                text: 'Score\n',
                                style: GoogleFonts.barlowSemiCondensed(
                                    fontSize: 15.0,
                                    color: const HSLColor.fromAHSL(
                                            1, 229, 0.64, 0.46)
                                        .toColor())),
                            TextSpan(
                                text: myPoints.toString(),
                                style: GoogleFonts.barlowSemiCondensed(
                                    fontSize: 40.0,
                                    color: const HSLColor.fromAHSL(
                                            1, 229, 0.25, 0.31)
                                        .toColor()))
                          ])))
                ],
              ),
            ),
            Container(
                padding:
                    const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                child: hasChosen
                    ? Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  iPicked,
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text('I picked',
                                      style: GoogleFonts.barlowSemiCondensed(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                      ))
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  comPicked,
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text('Machine Picked',
                                      style: GoogleFonts.barlowSemiCondensed(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                      ))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 40.0),
                          Text(message,
                              style: GoogleFonts.barlowSemiCondensed(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 60.0,
                              )),
                          const SizedBox(height: 40.0),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  // ignore: deprecated_member_use
                                  primary: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60.0, vertical: 10.0)),
                              onPressed: () {
                                setState(() {
                                  hasChosen = false;
                                });
                              },
                              child: Text('Play again!!',
                                  style: GoogleFonts.barlowSemiCondensed(
                                      color: const HSLColor.fromAHSL(
                                              1, 239, 0.49, 0.15)
                                          .toColor(),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0)))
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  if (vibrateCheck) {
                                    Vibration.vibrate(
                                        duration: 0, amplitude: 10);
                                  }
                                  userChoice = 'paper';
                                  compChoices();
                                  whowon(userChoice, compChoice);
                                  setState(() {
                                    myPoints;
                                    hasChosen;
                                  });
                                },
                                child: BigCircle(
                                    SvgPicture.asset(
                                        'assets/images/Sowmya/icon-paper.svg'),
                                    const HSLColor.fromAHSL(1, 230, 0.89, 0.62)
                                        .toColor(),
                                    const HSLColor.fromAHSL(1, 230, 0.49, 0.65)
                                        .toColor(),
                                    const HSLColor.fromAHSL(1, 229, 0.64, 0.49)
                                        .toColor()),
                              ),
                              InkWell(
                                onTap: () {
                                  if (vibrateCheck) {
                                    Vibration.vibrate(
                                        duration: 0, amplitude: 10);
                                  }
                                  userChoice = 'scissors';
                                  compChoices();
                                  whowon(userChoice, compChoice);
                                  setState(() {
                                    myPoints;
                                    hasChosen;
                                  });
                                },
                                child: BigCircle(
                                    SvgPicture.asset(
                                        'assets/images/Sowmya/icon-scissors.svg'),
                                    const HSLColor.fromAHSL(1, 39, 0.89, 0.49)
                                        .toColor(),
                                    const HSLColor.fromAHSL(1, 40, 0.84, 0.53)
                                        .toColor(),
                                    const HSLColor.fromAHSL(1, 39, 0.64, 0.46)
                                        .toColor()),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          InkWell(
                            onTap: () {
                              if (vibrateCheck) {
                                Vibration.vibrate(duration: 50, amplitude: 10);
                              }
                              userChoice = 'rock';
                              compChoices();
                              whowon(userChoice, compChoice);
                              setState(() {
                                myPoints;
                                hasChosen;
                              });
                            },
                            child: BigCircle(
                              SvgPicture.asset(
                                  'assets/images/Sowmya/icon-rock.svg'),
                              const HSLColor.fromAHSL(1, 349, 0.71, 0.52)
                                  .toColor(),
                              const HSLColor.fromAHSL(1, 349, 0.70, 0.56)
                                  .toColor(),
                              const HSLColor.fromAHSL(1, 349, 0.64, 0.46)
                                  .toColor(),
                            ),
                          )
                        ],
                      )),
          ],
        ),
      ),
    );
  }

  void compChoices() {
    Random random = Random();
    int randomNumber = random.nextInt(3);
    compChoice = _choices[randomNumber];
  }

  void whowon(userC, compC) {
    var rpsChoices = {
      'rock': {'scissors': 1, 'rock': 0.5, 'paper': 0},
      'paper': {'scissors': 0, 'rock': 1, 'paper': 0.5},
      'scissors': {'scissors': 0.5, 'rock': 0, 'paper': 1}
    };
    var myScore = rpsChoices[userC]?[compC];
    updateScore(myScore);
    picked();
    hasChosen = true;
  }

  updateScore(myScore) {
    if (myScore == 0) {
      return {message = 'You lost', myPoints += 0};
    } else if (myScore == 0.5) {
      return {message = 'It is a tie', myPoints += 0.5};
    } else {
      return {message = 'You won!', myPoints += 1};
    }
  }

  picked() {
    if (userChoice == 'paper') {
      iPicked = BigCircle(
          SvgPicture.asset('assets/images/Sowmya/icon-paper.svg'),
          const HSLColor.fromAHSL(1, 230, 0.89, 0.62).toColor(),
          const HSLColor.fromAHSL(1, 230, 0.49, 0.65).toColor(),
          const HSLColor.fromAHSL(1, 229, 0.64, 0.49).toColor());
    } else if (userChoice == 'rock') {
      iPicked = BigCircle(
          SvgPicture.asset('assets/images/Sowmya/icon-rock.svg'),
          const HSLColor.fromAHSL(1, 349, 0.71, 0.52).toColor(),
          const HSLColor.fromAHSL(1, 349, 0.70, 0.56).toColor(),
          const HSLColor.fromAHSL(1, 349, 0.64, 0.46).toColor());
    } else {
      iPicked = BigCircle(
          SvgPicture.asset('assets/images/Sowmya/icon-scissors.svg'),
          const HSLColor.fromAHSL(1, 39, 0.89, 0.49).toColor(),
          const HSLColor.fromAHSL(1, 40, 0.84, 0.53).toColor(),
          const HSLColor.fromAHSL(1, 39, 0.64, 0.46).toColor());
    }

    if (compChoice == 'paper') {
      comPicked = BigCircle(
          SvgPicture.asset('assets/images/Sowmya/icon-paper.svg'),
          const HSLColor.fromAHSL(1, 230, 0.89, 0.62).toColor(),
          const HSLColor.fromAHSL(1, 230, 0.49, 0.65).toColor(),
          const HSLColor.fromAHSL(1, 229, 0.64, 0.49).toColor());
    } else if (compChoice == 'rock') {
      comPicked = BigCircle(
          SvgPicture.asset('assets/images/Sowmya/icon-rock.svg'),
          const HSLColor.fromAHSL(1, 349, 0.71, 0.52).toColor(),
          const HSLColor.fromAHSL(1, 349, 0.70, 0.56).toColor(),
          const HSLColor.fromAHSL(1, 349, 0.64, 0.46).toColor());
    } else {
      comPicked = BigCircle(
          SvgPicture.asset('assets/images/Sowmya/icon-scissors.svg'),
          const HSLColor.fromAHSL(1, 39, 0.89, 0.49).toColor(),
          const HSLColor.fromAHSL(1, 40, 0.84, 0.53).toColor(),
          const HSLColor.fromAHSL(1, 39, 0.64, 0.46).toColor());
    }
  }
}

class BigCircle extends StatelessWidget {
  final Widget innerChild;
  final Color gradientColor1;
  final Color gradientColor2;
  final Color shadowColor;
  const BigCircle(this.innerChild, this.gradientColor1, this.gradientColor2,
      this.shadowColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [gradientColor1, gradientColor2]),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: shadowColor,
                spreadRadius: 1,
                offset: const Offset(1.0, 4))
          ],
          shape: BoxShape.circle),
      child: Container(
          padding: const EdgeInsets.all(20.0),
          width: 80.0,
          height: 80.0,
          decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0.6,
                    blurRadius: 7.0,
                    offset: Offset(4, -6))
              ]),
          child: innerChild),
    );
  }
}
