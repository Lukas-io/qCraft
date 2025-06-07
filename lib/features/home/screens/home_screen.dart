import 'package:flutter/material.dart';
import 'package:qcraft/features/home/bloc/upload_bloc.dart';
import 'package:qcraft/features/home/bloc/upload_event.dart';
import 'package:qcraft/features/home/screens/upload_screen.dart';

import '../../../injection_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
   sl<UploadBloc>().add(GetUploadedDocumentsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UploadScreen();
  }
}
