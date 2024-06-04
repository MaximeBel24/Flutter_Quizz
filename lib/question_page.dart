import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget{

  final mainColor;
  final textColor;

  QuestionPage({super.key, required this.mainColor, required this.textColor});

  @override
  QuestionPageState createState() => QuestionPageState();

}

class QuestionPageState extends State<QuestionPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.mainColor,
        title: Text(
          "Score",
          style: TextStyle(
          color: widget.textColor
          ),
        ),
        actions: [
        lightModeButton(),
        ]
      ),
    );
  }

}