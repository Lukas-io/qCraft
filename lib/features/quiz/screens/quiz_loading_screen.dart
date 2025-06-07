import 'package:flutter/material.dart';

class QuizLoadingScreen extends StatelessWidget {
  const QuizLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Quiz is generating..."),
      ),
    );
  }
}
