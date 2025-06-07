import 'package:dio/dio.dart';
import 'package:qcraft/core/model/document_model.dart';
import 'package:retrofit/retrofit.dart';

import '../constants/api_endpoints.dart';
import '../model/response_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseApiUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  // region Document
  @POST(ApiEndpoints.uploadDocument)
  @MultiPart()
  Future<HttpResponse<ResponseModel>> uploadDocument({
    @Part(name: 'files') required List<MultipartFile> files,
    @Header("Content-Type") required String contentType,
  });

  @GET(ApiEndpoints.document)
  Future<HttpResponse<ResponseModel<List<DocumentModel>>>> getDocuments(
      {@Query("ids") List<num>? documentIds});

  @DELETE(ApiEndpoints.document)
  Future<HttpResponse<ResponseModel>> deleteDocument(@Query("id") num id);

  //endregion

  @POST(ApiEndpoints.generateQuiz)
  Future<HttpResponse<ResponseModel>> generateQuiz(
      {@Body() required var value});
}
