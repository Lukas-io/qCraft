import 'package:dio/dio.dart';
import 'package:qcraft/core/model/document_model.dart';
import 'package:qcraft/core/services/api_service.dart';

import '../model/response_model.dart';
import '../resources/data_state.dart';
import '../resources/perform_request.dart';

class Repository {
  final ApiService _apiService;

  Repository(this._apiService);

  Future<DataState<ResponseModel<List<DocumentModel>>>> getDocuments(
      List<num>? documentIds) {
    return performRequest(_apiService.getDocuments(documentIds: documentIds));
  }

  Future<DataState<ResponseModel>> deleteDocument(num id) {
    return performRequest(_apiService.deleteDocument(id));
  }

  Future<DataState<ResponseModel>> uploadDocument(List<MultipartFile> files) {
    return performRequest(_apiService.uploadDocument(
      files: files,
      contentType: "multipart/form-data",
    ));
  }
}
