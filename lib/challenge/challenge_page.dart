import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/nexButton/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/quest_indicator/quest_indicator.dart';
import 'package:DevQuiz/challenge/widgets/quiz_widget/quiz_widget.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/models/question_models.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  ChallengePage({
    Key? key,
    required this.questions,
  }) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  //Controla a alteração da lista de qual questão o usuario tá
  void initState() {
    controller.currentPageNotifier.addListener(() {
      setState(() {});
    });
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(94),
          child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                //atualiza na tela somente o que e necessario  atualizar,mais desempenho
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentPage: value,
                    lenght: widget.questions.length,
                  ),
                )
              ],
            ),
          ),
        ),
        body: PageView(
            children: widget.questions
                .map((e) => QuizWidget(
                      question: e,
                      onChange: nextPage,
                    ))
                .toList()
            //widget. acessa o construtor do statefull
            ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                      children: [
                        if (value < widget.questions.length)
                          NextButtonWidget.white(
                            label: 'Pular',
                            onTap: nextPage,
                          ),
                        if (value == widget.questions.length)
                          SizedBox(width: 7),
                        NextButtonWidget.purple(
                          label: 'Proxima',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    )),
          ),
        ));
  }
}
