import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Carregando',
          style: AppTextStyles.body20,
        ),
        SizedBox(
          height: 30,
        ),
        CircularProgressIndicator(
          semanticsLabel: 'Carregando',
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        ),
      ],
    )));
  }
}
