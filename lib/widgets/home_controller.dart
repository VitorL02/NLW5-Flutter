import 'package:DevQuiz/home/home_repository.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/models/quiz_models.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/models/user_model.dart';
import 'package:DevQuiz/widgets/home_state.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  //Utilizando o ValueNotifier (Recurso do flutter),para avisar a home screen quando os dados foram recebidos
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  final repository = HomeRepository(); //entrega os dados do user.json

  UserModel? user;
  List<QuizModel>? quizzes;

//Uma função assincrona onde caso o dado ainda não esteja carragado
//A espera do mesmo sera feita
//No caso  o dado do usuario-preciso de um café
  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
