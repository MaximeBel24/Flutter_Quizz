import 'package:flutter/material.dart';
import 'package:quizz_flutter/question_page.dart';

class Home extends StatefulWidget{

  @override
  HomeState createState() => HomeState();

}

class HomeState extends State<Home> {

  Color mainColor = Colors.amber;
  Color textColor = Colors.black54;
  Color mainBGColor = Colors.white;
  Color cardColor = Colors.amberAccent;
  IconData lightIcon = Icons.dark_mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "The Big Quizz",
            style: TextStyle(
                color: textColor
            ),
          ) ,
          backgroundColor: mainColor,
          actions: [
            lightDarkModeButton()
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
                    color: mainBGColor,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 175,
                                horizontal: 20
                            ),
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
        color: cardColor,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Image.asset("images/quizz.jpg"),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: (){
                      final questionPage = QuestionPage(
                          mainColor: mainColor,
                          textColor: textColor,
                          mainBGColor: mainBGColor,
                        cardColor: cardColor,
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return questionPage;
                        })
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(mainColor)
                    ),
                    child: Text(
                      "Commencer le quizz",
                      style: TextStyle(
                          color: textColor
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

  IconButton lightDarkModeButton() {
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
