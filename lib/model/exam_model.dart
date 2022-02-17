class ExamModel {
  // ignore: deprecated_member_use
  List<Question> questions = List<Question>();
  ExamModel({List<Question> quest}) {
    questions = quest;
  }
}

class Question {
  String question;
  // ignore: deprecated_member_use
  List<Answer> answers = new List<Answer>();
  Question({List<Answer> answ, String ask}) {
    answers = answ;
    question = ask;
  }
}

class Answer {
  String answer;
  bool isRight;
  Answer({String answ, bool right}) {
    isRight = right;
    answer = answ;
  }
}
