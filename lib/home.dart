import 'package:flutter/material.dart';

class Home extends StatefulWidget{

  final mainColor;
  final textColor;
  final mainBGColor;
  final cardColor;
  final lightIcon;

  Home({
    required this.mainColor,
    required this.textColor,
    required this.mainBGColor,
    required this.cardColor,
    required this.lightIcon
  });

  @override
  HomeState createState() => HomeState();

}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ,
        body: Column(
          children: [
            Expanded(
                child: Container(
                    color: widget.mainBGColor,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 150),
                            child: startingGameCard()
                        ),
                      ],
                    )

                ))
          ],
        )
    );
  }

  Card startingGameCard(){
    return Card(
        color: widget.cardColor,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Image.asset("images/quizz.jpg"),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: (){

                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(widget.mainColor)
                    ),
                    child: Text(
                      "Commencer le quizz",
                      style: TextStyle(
                          color: widget.textColor
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
  }
}