import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/challenge/widgets/quiz_widget/quiz_widget.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/home/loadingScreen.dart';
import 'package:DevQuiz/widgets/appBar/app_bar_widget.dart';
import 'package:DevQuiz/widgets/home_controller.dart';
import 'package:DevQuiz/widgets/home_state.dart';
import 'package:DevQuiz/widgets/levelButton/level_button_widget.dart';
import 'package:DevQuiz/widgets/quizCard/quiz_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
//Função que e chamada antes da renderização da tela,com o null safety ele não permite que dados do user sejam nulos,e quebra a tela
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
          appBar: AppBarWidget(
            user: controller.user!,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LevelButton(label: "Fácil"),
                      LevelButton(label: "Médio"),
                      LevelButton(label: "Difícil"),
                      LevelButton(label: "Perito"),
                    ]),
                SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    children: controller.quizzes!
                        .map((e) => QuizCardWidget(
                              title: e.title,
                              percent: e.questionAnswered / e.questions.length,
                              completed:
                                  "${e.questionAnswered}/ ${e.questions.length}",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChallengePage(
                                      questions: e.questions,
                                    ),
                                  ),
                                );
                              },
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ));
    }
    //Se os dados ainda não tiverem sido carregados ou nem mesmo passados,a tela de loading sera renderizada
    else {
      return Scaffold(
        body: LoadingScreen(),
      );
    }
  }
}
