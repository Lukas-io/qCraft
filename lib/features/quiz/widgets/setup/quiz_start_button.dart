import 'package:flutter/material.dart';
import 'package:qcraft/features/quiz/screens/quiz_loading_screen.dart';

import '../../../../core/constants/app_text_sizes.dart';

class QuizStartButton extends StatefulWidget {
  const QuizStartButton({super.key});

  @override
  State<QuizStartButton> createState() => _QuizStartButtonState();
}

class _QuizStartButtonState extends State<QuizStartButton> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: !isEnabled
          ? null
          : () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => QuizLoadingScreen(),
              )),
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, 48),
        backgroundColor: isEnabled ? null : Colors.grey.shade400,
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Text(
        "Generate Quiz",
        style: TextStyle(
            color: isEnabled ? Colors.white : Colors.grey.shade200,
            fontSize: AppTextSizes.body,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
