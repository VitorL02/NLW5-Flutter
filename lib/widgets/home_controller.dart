import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/models/awnser_model.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/models/question_models.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/models/quiz_models.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/models/user_model.dart';
import 'package:DevQuiz/widgets/home_state.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  //Utilizando o ValueNotifier (Recurso do flutter),para avisar a home screen quando os dados foram recebidos
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

//Uma função assincrona onde caso o dado ainda não esteja carragado
//A espera do mesmo sera feita
//No caso  o dado do usuario-preciso de um café
  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    user = UserModel(
        name: "Vitor Dev",
        photoUrl: 'https://avatars.githubusercontent.com/u/68614036?v=4');
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    quizzes = [
      QuizModel(
          image: AppImages.blocks,
          level: Level.facil,
          title: 'Nlw5 Flutter',
          questions: [
            QuestionModel(title: 'Essa e uma pergunta de Flutter', anwsers: [
              AwnserModel(title: 'Esta incrivel'),
              AwnserModel(title: 'Esta incrivel'),
              AwnserModel(title: 'Esta incrivel'),
              AwnserModel(title: 'Esta incrivel', isRight: true),
            ])
          ])
    ];
    state = HomeState.success;
  }
}
