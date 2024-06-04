import 'package:flutter/material.dart';

class AppBar extends StatefulWidget{

    @override
    AppBarState createState() => AppBarState();

}

class AppBarState extends State<AppBar>{

  Color mainColor = Colors.amber;
  Color textColor = Colors.black54;
  Color mainBGColor = Colors.white;
  Color cardColor = Colors.amberAccent;
  IconData lightIcon = Icons.dark_mode;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: mainColor,
        title: Text(
          "The Big Quizz",
          style: TextStyle(
              color: textColor
          ),
        ),
        actions: [
          lightModeButton(),
        ]
    );
  }
}