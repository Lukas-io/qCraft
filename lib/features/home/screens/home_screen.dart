import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcraft/core/constants/app_colors.dart';
import 'package:qcraft/features/home/bloc/upload_bloc.dart';
import 'package:qcraft/features/home/bloc/upload_event.dart';
import 'package:qcraft/features/home/screens/upload_screen.dart';
import 'package:qcraft/features/quiz/bloc/quiz_event.dart';

import '../../../injection_container.dart';
import '../../quiz/bloc/quiz_bloc.dart';
import '../../quiz/screens/quiz_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    sl<UploadBloc>().add(GetUploadedDocumentsEvent());
    sl<QuizBloc>().add(GetQuizzes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: TabBar(
            tabs: [
              SafeArea(
                child: Tab(
                  child: Text("Quizzes"),
                ),
              ),
              SafeArea(
                child: Tab(
                  child: Text("Files"),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: IconButton.filled(
            onPressed: () => sl<UploadBloc>().add(
              UploadDocumentEvent(),
            ),
            icon: Icon(
              CupertinoIcons.plus,
              size: 30,
              color: AppColors.primary.withOpacity(0.8),
            ),
            style: IconButton.styleFrom(
              padding: EdgeInsets.all(12.0),
              backgroundColor: Colors.white,
              elevation: 25,
              shadowColor: Colors.black54,
            ),
          ),
          body: TabBarView(children: [
            QuizListScreen(),
            UploadScreen(),
          ])),
    );
  }
}
