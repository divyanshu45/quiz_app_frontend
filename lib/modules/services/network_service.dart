import 'package:dio/dio.dart';

class RemoteService {
  late final Dio _dio;

  RemoteService() {
    setUp();
  }

  void setUp() {
    BaseOptions dioOptions = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json,
    );
    _dio = Dio(dioOptions);
  }

  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParams,
    required String token
  }) async {
    try {
      final response = await _dio.get(
          path,
          queryParameters: queryParams,
          options: Options(
              headers: {
                'Accept': Headers.jsonContentType,
                'Authorization': token
              }
          )
      );
      return response;
    } on DioException catch(e){
      throw CustomException(message: e.message ?? 'Custom message');
    }
  }

  Future<Response> post({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? payload,
    required String token
  }) async {
    try {
      final response = await _dio.post(
          path,
          queryParameters: queryParams,
          data: payload,
          options: Options(
              headers: {
                'Accept': Headers.jsonContentType,
                'Authorization': token
              }
          )
      );
      return response;
    } on DioException catch (error) {
      rethrow;
    }
  }

  Future<Response> put({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? payload,
    required String token
  }) async {
    try {
      final response = await _dio.put(
          path,
          queryParameters: queryParams,
          data: payload,
          options: Options(
              headers: {
                'Accept': Headers.jsonContentType,
                'Authorization': token
              }
          )
      );
      return response;
    } on DioException catch (error) {
      rethrow;
    }
  }

  Future<Response> delete({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? payload,
  }) async {
    try {
      final response =
      await _dio.delete(path, queryParameters: queryParams, data: payload);
      return response;
    } on DioException catch (error) {
      rethrow;
    }
  }
}

class CustomException implements Exception {
  String message;
  CustomException({required this.message});

  @override
  String toString() {
    return message;
  }
}