import 'package:DevQuiz/challenge/widgets/nexButton/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/quest_indicator/quest_indicator.dart';
import 'package:DevQuiz/challenge/widgets/quiz_widget/quiz_widget.dart';
import 'package:DevQuiz/resultPage/result_page.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/models/question_models.dart';
import 'package:flutter/material.dart';

import 'challenge_controller.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

//test 2
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    controller.currentPageNotifier.addListener(() {
      setState(() {});
    });
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
      //print(pageController.page!);
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  void onChange(bool value) {
    if (value) {
      controller.acertos++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
                ValueListenableBuilder(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, child) {
                    return QuestionIndicatorWidget(
                      currentPage: controller.currentPage,
                      lenght: widget.questions.length,
                    );
                  },
                )
              ],
            )),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onChange: onChange,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (value < widget.questions.length)
                        Expanded(
                            child: NextButtonWidget.white(
                          label: "Pular",
                          onTap: () {
                            nextPage();
                          },
                        )),
                      if (value == widget.questions.length)
                        Expanded(
                            child: NextButtonWidget.green(
                          label: "Confirmar",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  title: widget.title,
                                  result: controller.acertos,
                                  lenght: widget.questions.length,
                                ),
                              ),
                            );
                          },
                        )),
                    ],
                  )),
        ),
      ),
    ));
  }
}
