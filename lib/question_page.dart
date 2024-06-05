import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:quizz_flutter/datas.dart';
import 'package:quizz_flutter/home.dart';
import 'package:quizz_flutter/question.dart';
import 'package:quizz_flutter/text_with_style.dart';

class QuestionPage extends StatefulWidget{

  final mainColor;
  final textColor;
  final mainBGColor;
  final cardColor;

  QuestionPage({
    super.key,
    required this.mainColor,
    required this.textColor,
    required this.mainBGColor,
    required this.cardColor
  });

  @override
  QuestionPageState createState() => QuestionPageState();

}

class QuestionPageState extends State<QuestionPage> {

  List<Question> questions = Datas().listeQuestions;
  int index = 0;
  int score = 0;

  Color mainColor = Colors.amber;
  Color textColor = Colors.black54;
  Color mainBGColor = Colors.white;
  Color cardColor = Colors.amberAccent;
  IconData lightIcon = Icons.dark_mode;

  @override
  Widget build(BuildContext context) {
    final Question question = questions[index];

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: textColor
        ),
        backgroundColor: mainColor,
        title: Text(
          "Score : $score",
          style: TextStyle(
              color: textColor
          ),
        ),
        actions: [
          lightDarkModeButton()
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                color: mainBGColor,
                child: Card(
                  color: cardColor,
                  margin: EdgeInsets.all(17),
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextWithStyle(
                          data: 'Question numéro : ${index + 1} / ${questions
                              .length}',
                          color: textColor,
                          style: FontStyle.italic,),
                        TextWithStyle(data: question.question,
                          size: 21,
                          weight: FontWeight.bold,
                          align: TextAlign.center,
                          color: textColor,
                        ),
                        Image.asset(question.getImage()),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            answerBtn(false),
                            answerBtn(true)
                          ],
                        )
                      ],
                    ),
                  ),
                ),

              ))
        ],
      ),
    );
  }

  Future<void> showAnswer(bool bonneReponse) async {
    Question question = questions[index];
    String title = (bonneReponse) ? "Gagné !" : "Perdu !";
    String gifToShow = (bonneReponse) ? "win.gif" : "lose.gif";
    String path = "images/$gifToShow";
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: mainBGColor,
            title: TextWithStyle(
              data: title,
              align: TextAlign.center,
              color: (bonneReponse) ? Colors.green : Colors.red,
              size: 20,
              weight: FontWeight.bold,
              style: FontStyle.italic,
            ),
            children: [
              Gif(
                image: AssetImage(path),
                // fps: 30,
                duration: const Duration(seconds: 3),
                autostart: Autostart.loop,
              ),
              TextWithStyle(
                data: question.explication,
                align: TextAlign.center,
                color: textColor,
              ),
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                    toNextQuestion();
                  },
                  child: TextWithStyle(data: "Question Suivante",color: textColor,),
                ),
            ],
          );
        });
  }

  Future<void> showResult() async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            backgroundColor: mainBGColor,
            title: TextWithStyle(data: "C'est fini !", align: TextAlign.center, weight: FontWeight.bold, size: 25, color: textColor,),
            content: TextWithStyle(
              data: "Votre score est de : $score points", align: TextAlign.center, color: textColor,
            ),
            actions: [
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(ctx).pop();
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(mainColor)

                  ),
                  child:
                  TextWithStyle(data: "OK",color: textColor,),
                ),
              )

            ],
          );
        }
    );
  }

  void toNextQuestion() {
    if (index < questions.length - 1) {
      index ++;
      setState(() {

      });
    } else {
      showResult();
    }
  }

  ElevatedButton answerBtn(bool b) {
    return ElevatedButton(
      onPressed: () {
        checkAnswer(b);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: (b) ? Colors.greenAccent : Colors.redAccent),
      child: Text(
        (b) ? "VRAI" : "FAUX", style: const TextStyle(color: Colors.white),),
    );
  }

  checkAnswer(bool answer) {
    final question = questions[index];
    bool bonneReponse = (question.reponse == answer);

    if(bonneReponse) {
      setState(() {
        score ++;
      });
    }
    showAnswer(bonneReponse);
  }

  IconButton lightDarkModeButton() {
    return IconButton(
        icon: Icon(lightIcon),
        color: textColor,
        onPressed: () {
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