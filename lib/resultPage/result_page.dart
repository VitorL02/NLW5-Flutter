import 'package:DevQuiz/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/nexButton/next_button_widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int lenght;
  final int result;

  const ResultPage({
    Key? key,
    required this.result,
    required this.lenght,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Text.rich(
                    TextSpan(
                        text: "\nVocê Concluiu ",
                        style: AppTextStyles.body,
                        children: [
                          TextSpan(
                              text: "\n$title ", style: AppTextStyles.bodyBold),
                          TextSpan(
                              text: "com $result de $lenght acertos",
                              style: AppTextStyles.body),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68.0),
                      child: Expanded(
                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                                'Dev Quiz  NLW5 Flutter - Resultado do quiz : $title\nObtive: ${result / lenght} % de aproveitamento ');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68.0),
                      child: Expanded(
                        child: NextButtonWidget.white(
                          label: "Voltar pro Inicio",
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
