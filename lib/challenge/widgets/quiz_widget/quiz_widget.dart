import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/models/awnser_model.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/models/question_models.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onChange;
  QuizWidget({Key? key, required this.question, required this.onChange})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  AwnserModel awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          height: 24,
        ),
        Flexible(
          child: Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
        ),
        SizedBox(height: 24),
        for (var i = 0; i < widget.question.awnsers.length; i++)
          AwnserWidget(
            disabled: indexSelected != -1,
            awnser: awnser(i),
            isSelected: indexSelected == i,
            onTap: (value) {
              indexSelected = i;
              setState(() {});
              Future.delayed(Duration(seconds: 1))
                  .then((_) => widget.onChange(value));
            },
          )
      ]),
    );
  }
}
