import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/state_management/model/job_overview.dart';

class JobRepo {

  static Dio getDio() {
    final options = BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 15000,
      responseType: ResponseType.json,
      contentType: "application/json",
      validateStatus: (status) {
        return true;
      },
      baseUrl: 'https://nhankiet-stage.inapps.technology',
    );
    final Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }

  static Future<JobListResponse> getJobList({String? search, int? page, String? categoryId}) async {
    Dio dio = getDio();
    var formData = FormData.fromMap({
      'mobile' : true,
      // 'search' : '${search??''}',
      // 'page' : '${page??''}',
      // 'position' : '${categoryId??''}'
    });
    dio.options.headers["authorization"] = '';
    var response = await dio.post<String>(
        '/api/recruitment/recruitment_portal/search_job',
        data: formData
    );
    // await dio.get<String>(Tools.buildUrlDio('recruitment/recruitment_portal?mobile=true'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return JobListResponse.fromJson(jsonDecode(response.data??''));
    } else {
      final body = jsonDecode(response.data??'');
      throw Exception(body['message'].toString());
    }
  }
}