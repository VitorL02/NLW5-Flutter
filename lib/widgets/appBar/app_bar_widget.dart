import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/widgets/scoreCard/score_card_widget.dart';
import 'package:flutter/material.dart';

//O preffered size e necessario pois a appBar pede um tamanho pre definido

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 161,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text.rich(TextSpan(
                          text: "Ola, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: 'Vitor Dev',
                              style: AppTextStyles.titleBold,
                            ),
                          ])),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://avatars.githubusercontent.com/u/68614036?v=4')),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(alignment: Alignment(0.0, 1.0), child: ScoreCardWidget())
              ],
            ),
          ),
        );
}
