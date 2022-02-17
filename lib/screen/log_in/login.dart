import 'dart:ui';

import 'package:exam_task/screen/exam/exam.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .5,
              child: Center(
                child: Image.asset("assets/images/final_exam.jpg"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                  hintText: 'Enter your name',
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                elevation: MaterialStateProperty.all(3),
              ),
              child: Text(
                'Commet',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (controller.text != null && controller.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExamScreen(
                              userName: controller.text,
                            )),
                  );
                } else

                  // ignore: deprecated_member_use
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("ارجو ادخال اسم الطالب")));
              },
            )
          ],
        ),
      ),
    );
  }
}
