import 'package:flutter/material.dart';
import 'package:qcraft/core/model/document_model.dart';
import 'package:qcraft/features/quiz/widgets/setup/quiz_difficulty_widget.dart';
import 'package:qcraft/features/quiz/widgets/setup/quiz_duration_widget.dart';
import 'package:qcraft/features/quiz/widgets/setup/quiz_length_widget.dart';
import 'package:qcraft/features/quiz/widgets/setup/quiz_scope_widget.dart';
import 'package:qcraft/features/quiz/widgets/setup/quiz_type_widget.dart';

import '../widgets/setup/quiz_start_button.dart';

class QuizSetupScreen extends StatefulWidget {
  final List<DocumentModel> selectedDocuments;

  const QuizSetupScreen({super.key, required this.selectedDocuments});

  @override
  State<QuizSetupScreen> createState() => _QuizSetupScreenState();
}

class _QuizSetupScreenState extends State<QuizSetupScreen> {
  late List<DocumentModel> documents;

  @override
  void initState() {
    documents = widget.selectedDocuments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Start Quiz"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              QuizScopeWidget(
                selectedDocuments: documents,
                onUpdate: (docs) {
                  documents = docs;
                },
              ),
              QuizLengthWidget(
                onUpdate: (questions) {},
              ),
              QuizDifficultyWidget(
                onUpdate: (difficulty) {},
              ),
              QuizDurationWidget(
                onUpdate: (duration) {},
              ),
              QuizTypeWidget(
                onUpdate: (type) {},
              ),
              QuizStartButton(),
            ],
          ),
        ),
      ),
    );
  }
}
