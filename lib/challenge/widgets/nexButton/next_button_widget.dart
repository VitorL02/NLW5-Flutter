import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;

  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final Color tapColor;

  final VoidCallback onTap;

  NextButtonWidget(
      {required this.label,
      required this.backgroundColor,
      required this.fontColor,
      required this.borderColor,
      required this.tapColor,
      required this.onTap});

  NextButtonWidget.purple({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.onTap = onTap,
        this.tapColor = Colors.greenAccent,
        this.label = label;
  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.onTap = onTap,
        this.borderColor = AppColors.border,
        this.tapColor = AppColors.lightGrey,
        this.label = label;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        height: 48,
        child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(tapColor),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            side: MaterialStateProperty.all(
              BorderSide(color: borderColor),
            ),
          ),
          onPressed: () {},
          child: Text(
            label,
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w600, fontSize: 15, color: fontColor),
          ),
        ),
      ),
    );
  }
}
