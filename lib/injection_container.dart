import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qcraft/core/services/file_upload_service.dart';
import 'package:qcraft/core/services/repository.dart';
import 'package:qcraft/features/home/bloc/upload_bloc.dart';

import 'core/services/api_service.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  //Api
  sl.registerSingleton<ApiService>(ApiService(sl<Dio>()));

  //Service
  sl.registerSingleton<Repository>(Repository(sl<ApiService>()));

  //Bloc
  sl.registerSingleton<UploadBloc>(
      UploadBloc(FileUploadService(), sl<Repository>()));
}
