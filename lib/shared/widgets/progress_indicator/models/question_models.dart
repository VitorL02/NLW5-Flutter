import 'dart:convert';

import 'package:DevQuiz/shared/widgets/progress_indicator/models/awnser_model.dart';

class QuestionModel {
  final String title;

  //A lista de questões consome o modelo de perguntas
  final List<AwnserModel> anwsers;

//assert garante que a lista de perguntas tenham exatamente 4 e não quebre o layout

  QuestionModel({required this.title, required this.anwsers})
      : assert(anwsers.length == 4);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'anwsers': anwsers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      anwsers: List<AwnserModel>.from(
          map['anwsers']?.map((x) => AwnserModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
