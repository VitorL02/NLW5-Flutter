import 'package:DevQuiz/challenge/widgets/nexButton/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/quest_indicator/quest_indicator.dart';
import 'package:DevQuiz/challenge/widgets/quiz_widget/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  ChallengePage({Key? key}) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: QuestionIndicatorWidget(),
            ),
          ),
        ),
        body: QuizWidget(title: "O que o Flutter faz em sua totalidade ?"),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NextButtonWidget.white(label: 'Pular'),
                SizedBox(width: 7),
                NextButtonWidget.purple(label: 'Proxima'),
              ],
            ),
          ),
        ));
  }
}
