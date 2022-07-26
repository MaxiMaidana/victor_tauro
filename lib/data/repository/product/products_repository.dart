import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:victor_tauro/data/models/products/nail_polish.dart';
import 'package:victor_tauro/features/home/domain/repository/product_repository.dart';

import '../../models/response.dart';

class ProductsRepository extends RProductRepository {
  @override
  Future<List<NailPolish>> getProducts() async {
    try {
      final data =
          await rootBundle.loadString('lib/core/data_fake/nail_polish.json');

      Map<String, dynamic> dataMap = json.decode(data);

      List<NailPolish> nailPolishs = List<NailPolish>.from(
        dataMap['nailPolishs'].map(
          (nailPolish) => NailPolish.fromJson(nailPolish),
        ),
      );

      return nailPolishs;
    } catch (e) {
      if (e is DioError) {
        throw ResponseModel(statusCode: 403, data: false);
      } else {
        rethrow;
      }
    }
  }
}
