import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  const ScoreCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 14),
      child: Container(
          height: 136,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Widget expanded avisa o flutter que os widgets ocuparam um espaço maior
                Expanded(
                  flex: 1,
                  child: ChartWidget(),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vamos Começar",
                            style: AppTextStyles.heading,
                          ),
                          Text("Complete os desafios e avance em conhecimento",
                              style: AppTextStyles.body),
                        ]),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
