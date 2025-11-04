import 'package:dio/dio.dart';
import 'package:movies/core/database/api/api_consumer.dart';
import 'package:movies/core/database/api/end_point.dart';
import 'package:movies/core/errors/exceptions.dart';

class DioConcumer extends ApiConsumer {
  final Dio dio;

  DioConcumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        logPrint: (obj) {
          // هنا بيتطبع اللوجز كلها
          print(obj);
        },
      ),
    );
  }
  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? querParameters,
  }) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? querParameters,
  }) async {
    try {
      var res = await dio.get(
        path,
        data: data,
        queryParameters: querParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future patch(
    String path, {
    Object? data,
    Map<String, dynamic>? querParameters,
    bool isFormData = false,
  }) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? querParameters,
    bool isFormData = false,
  }) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
