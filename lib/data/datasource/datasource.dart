import '../models/response.dart';

abstract class DataSource {
  Future<ResponseModel> getDataSource();
  Future<ResponseModel> postDataSource();
  Future<ResponseModel> putDataSource();
  Future<ResponseModel> deleteDataSource();
}
