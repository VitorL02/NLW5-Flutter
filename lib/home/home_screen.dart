import 'package:DevQuiz/widgets/appBar/app_bar_widget.dart';
import 'package:DevQuiz/widgets/levelButton/level_button_widget.dart';
import 'package:DevQuiz/widgets/quizCard/quiz_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                LevelButton(label: "Fácil"),
                LevelButton(label: "Médio"),
                LevelButton(label: "Difícil"),
                LevelButton(label: "Perito"),
              ]),
              QuizCardWidget()
            ],
          ),
        ));
  }
}
