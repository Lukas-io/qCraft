import 'package:flutter/material.dart';
import 'package:qcraft/features/home/bloc/upload_event.dart';

import '../../../injection_container.dart';
import '../bloc/upload_bloc.dart';
import '../widgets/upload_widget.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Files"),
        actions: [
          IconButton(
            onPressed: () => sl<UploadBloc>().add(
              UploadDocumentEvent(),
            ),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: UploadWidget(),
        ),
      ),
    );
  }
}
