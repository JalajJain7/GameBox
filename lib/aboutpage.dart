import 'package:flappy_bird/FlappyBird/theme.dart';
import 'package:flappy_bird/data.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ignore: prefer_const_constructors
          Text(
            "Our Team",
            // ignore: prefer_const_constructors
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: MyTheme.whitecolour),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                color: MyTheme.whitecolour,
              ),
              itemCount: TeamData.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 15),
                  height: 300,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            AssetImage(TeamData[index]['image'].toString()),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        TeamData[index]['name'].toString(),
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: MyTheme.whitecolour),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        TeamData[index]['rollno'].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: MyTheme.player1Colour,
                        ),
                      ),
                      // Discription of person
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// Container(
//                     height: 100,
//                     child: Card(
//                       semanticContainer: true,
//                       margin: const EdgeInsets.all(10),
//                       color: const Color.fromARGB(220, 255, 255, 255),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           radius: 20,
//                           backgroundImage:
//                               AssetImage(TeamData[index]['image'].toString()),
//                         ),
//                         title: Text(
//                           TeamData[index]['name'].toString(),
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: Text(TeamData[index]['rollno'].toString()),
//                       ),
//                     ),
//                   );