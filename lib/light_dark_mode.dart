import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LightDarkMode extends StatefulWidget {

  @override
  LightDarkModeState createState() => LightDarkModeState();

}

class LightDarkModeState extends State<LightDarkMode> {


  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(lightIcon),
        color: textColor,
        onPressed: (){
          setState(() {
            mainColor = (mainColor == Colors.amber)
                ? Colors.indigo
                : Colors.amber;

            textColor = (textColor == Colors.black54)
                ? Colors.white
                : Colors.black54;

            mainBGColor = (mainBGColor == Colors.white)
                ? Colors.black
                : Colors.white;

            cardColor = (cardColor == Colors.amberAccent)
                ? Colors.indigoAccent
                : Colors.amberAccent;

            lightIcon = (lightIcon == Icons.dark_mode)
                ? Icons.light_mode
                : Icons.dark_mode;
          });
        });
    }


  }
