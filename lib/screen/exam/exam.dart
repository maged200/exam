import 'dart:math';

import 'package:exam_task/model/exam_model.dart';
import 'package:exam_task/screen/log_in/login.dart';
import 'package:flutter/material.dart';

class ExamScreen extends StatefulWidget {
  final String userName;
  const ExamScreen({Key key, @required this.userName}) : super(key: key);

  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  int score = 0;
  int selected;
  Random random = Random();
  int questionindex = 0;
  List<int> selectedindex = [];
  final ExamModel model = new ExamModel(
    quest: [
      Question(
        ask: "ما هو عدد الدول العربيه",
        answ: [
          Answer(
            answ: "22",
            right: true,
          ),
          Answer(
            answ: "11",
            right: false,
          ),
          Answer(
            answ: "15",
            right: false,
          ),
          Answer(
            answ: "16",
            right: false,
          )
        ],
      ),
      Question(
        ask: "ما هو عدد الدول العالم",
        answ: [
          Answer(
            answ: "255",
            right: true,
          ),
          Answer(
            answ: "200",
            right: false,
          ),
          Answer(
            answ: "220",
            right: false,
          ),
          Answer(
            answ: "235",
            right: false,
          )
        ],
      ),
      Question(
        ask: "ما هو عدد الحروف الابجدية",
        answ: [
          Answer(
            answ: "28",
            right: true,
          ),
          Answer(
            answ: "26",
            right: false,
          ),
          Answer(
            answ: "24",
            right: false,
          ),
          Answer(
            answ: "30",
            right: false,
          )
        ],
      ),
      Question(
        ask: "اختر العدد الاولي ",
        answ: [
          Answer(
            answ: "3",
            right: true,
          ),
          Answer(
            answ: "4",
            right: false,
          ),
          Answer(
            answ: "6",
            right: false,
          ),
          Answer(
            answ: "8",
            right: false,
          )
        ],
      ),
      Question(
        ask: "اختر المجموع الصحيح(20+50)",
        answ: [
          Answer(
            answ: "70",
            right: true,
          ),
          Answer(
            answ: "60",
            right: false,
          ),
          Answer(
            answ: "50",
            right: false,
          ),
          Answer(
            answ: "07",
            right: false,
          )
        ],
      ),
    ],
  );
  @override
  void initState() {
    questionindex = random.nextInt(model.questions.length);
    selectedindex.add(questionindex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.userName),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(model.questions[questionindex].question)),
          Expanded(
            child: ListView.builder(
              itemCount: model.questions[questionindex].answers.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * .1,
                  child: RadioListTile(
                    title: Text(
                        model.questions[questionindex].answers[index].answer),
                    value: index,
                    groupValue: selected,
                    selectedTileColor: Colors.green,
                    onChanged: (int value) {
                      setState(() {
                        selected = value;
                        int check = random.nextInt(model.questions.length);
                        if (model.questions[questionindex].answers[selected]
                            .isRight) {
                          score++;
                        }
                        if (!selectedindex.contains(check)) {
                          setState(() {
                            selectedindex.add(check);
                            questionindex = check;
                          });
                        } else {
                          setState(() {
                            check = random.nextInt(model.questions.length);
                            selectedindex.add(check);
                            questionindex = check;
                          });
                        }
                        if (selectedindex.length - 1 >=
                            model.questions.length) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(widget.userName),
                                content:
                                    Text("النتيجة التي حصلت عليها هي : $score"),
                                actions: [
                                  TextButton(
                                    child: Text("اعادة الامتحان"),
                                    onPressed: () {
                                      setState(() {
                                        selectedindex = [];
                                        selectedindex.add(random
                                            .nextInt(model.questions.length));
                                        questionindex = 0;
                                        score = 0;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: Text("انهاء"),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        selected = null;
                      });
                    },
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
