import '../models/response.dart';

import 'package:dio/dio.dart';

import 'datasource.dart';

class DioDataSource extends DataSource {
  final String _url;
  DioDataSource({required String url}) : _url = url;

  Dio client = Dio();

  @override
  Future<ResponseModel> deleteDataSource() {
    // TODO: implement deleteDataSource
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getDataSource() async {
    ResponseModel responseModel;
    try {
      final res = await client.get(_url);
      responseModel =
          ResponseModel(statusCode: res.statusCode!, data: res.data);
      return responseModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseModel> postDataSource() {
    // TODO: implement postDataSource
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> putDataSource() {
    // TODO: implement putDataSource
    throw UnimplementedError();
  }
}
