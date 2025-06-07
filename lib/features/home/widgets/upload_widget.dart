import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcraft/features/home/widgets/upload_document_list.dart';
import 'package:qcraft/features/home/widgets/upload_empty_widget.dart';

import '../../../injection_container.dart';
import '../bloc/upload_bloc.dart';
import '../bloc/upload_state.dart';

class UploadWidget extends StatefulWidget {
  const UploadWidget({super.key});

  @override
  State<UploadWidget> createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UploadBloc>.value(
      value: sl<UploadBloc>(),
      child: BlocBuilder<UploadBloc, UploadState>(
        buildWhen: (stateA, stateB) {
          if (stateB is RetrievedUploadedDocument) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state.documents == null || (state.documents?.isEmpty ?? false)) {
            return UploadDocumentEmptyWidget();
          }

          return UploadDocumentList(
            documents: state.documents!,
          );
        },
      ),
    );
  }
}
