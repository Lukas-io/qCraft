import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcraft/core/enums/bloom_taxonomy_level.dart';
import 'package:qcraft/core/model/quiz_model.dart';
import 'package:qcraft/features/quiz/screens/quiz_loading_screen.dart';
import 'package:qcraft/features/quiz/widgets/quiz_info_sheet.dart';

class QuizListTile extends StatelessWidget {
  final QuizModel quiz;

  const QuizListTile({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        quiz.title ?? "No title",
        style: TextStyle(overflow: TextOverflow.ellipsis),
        maxLines: 2,
      ),
      subtitle: Row(
        children: [
          Chip(
            padding: EdgeInsetsGeometry.symmetric(),
            label: Text(
              getDifficultyLabel(quiz.difficulty!).toUpperCase(),
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.1),
            ),
          ),
          Chip(
            padding: EdgeInsetsGeometry.symmetric(),
            label: Text(
              "${quiz.questions!.length} questions".toUpperCase(),
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.1),
            ),
          ),
          if (quiz.duration != null)
            Chip(
              padding: EdgeInsetsGeometry.symmetric(),
              label: Text(
                "${quiz.duration} mins".toUpperCase(),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.1),
              ),
            ),
        ]
            .map(
              (child) => Padding(
                padding: EdgeInsetsGeometry.only(right: 12.0),
                child: child,
              ),
            )
            .toList(),
      ),
      trailing: IconButton.filled(
        onPressed: () {},
        icon: Icon(
          getBloomCupertinoIcon(getBloomLevel(quiz.difficulty!)),
          color: Colors.white,
          // size: 30,
        ),
        style: IconButton.styleFrom(
            backgroundColor: getBloomColor(getBloomLevel(quiz.difficulty!))),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      onTap: () => Navigator.push(
        context,
        CupertinoSheetRoute(
          builder: (context) => QuizInfoSheet(
            quiz: quiz,
            actionButton: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizLoadingScreen(
                    quiz.id!,
                  ),
                ),
              );
            },
            actionText: "Generate",
          ),
        ),
      ),
    );
  }
}
