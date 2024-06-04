class Question {
  
  late int id;
  late String question;
  late String image;
  late List<String> wrong_answer;
  late String good_answer;

  Question({
    required this.id,
    required this.question,
    required this.image,
    required this.wrong_answer,
    required this.good_answer
  });
}

