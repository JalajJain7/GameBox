import 'package:flappy_bird/four/theme.dart';

import 'package:flutter/material.dart';

class player extends StatefulWidget {
  const player({super.key, this.onpress});
  final VoidCallback? onpress;

  @override
  State<player> createState() => _playerState(onpress);
}

class _playerState extends State<player> {
  final VoidCallback? onpress;

  _playerState(this.onpress);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: MyTheme.backgroundColour,
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          CircleAvatar(
            backgroundColor: MyTheme.yellowcolor,
            radius: MediaQuery.of(context).size.width / 13,
            child: CircleAvatar(
              foregroundImage:
                  const AssetImage('assets/images/team/mahak.jpeg'),
              radius: MediaQuery.of(context).size.width / 14,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
            // child: Text(
            //   player1,
            //   style: TextStyle(color: MyTheme.yellowcolor,fontSize: 15,fontWeight:FontWeight.w700),
            // ),
          ),
          const Spacer(
            flex: 4,
          ),
          MaterialButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              color: Colors.white,
              child: const Text("Reset",
                  style: TextStyle(
                      color: MyTheme.backgroundColour,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
              onPressed: () {
                onpress!();
              }),
          const Spacer(
            flex: 4,
          ),
          const Padding(
            padding: EdgeInsets.all(5),
            // child: Text(
            //   player2,
            //   style: TextStyle(color: MyTheme.pinkcolor,fontSize: 15,fontWeight:FontWeight.w700),

            // ),
          ),
          CircleAvatar(
            backgroundColor: MyTheme.pinkcolor,
            radius: MediaQuery.of(context).size.width / 13,
            child: CircleAvatar(
              foregroundImage:
                  const AssetImage('assets/images/team/mahak.jpeg'),
              radius: MediaQuery.of(context).size.width / 14,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
