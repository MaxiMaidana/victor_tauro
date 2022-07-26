import 'package:victor_tauro/data/repository/product/products_repository.dart';

import '../../../../data/models/products/nail_polish.dart';

class GetProducts {
  Future<List<NailPolish>> call() async {
    try {
      List<NailPolish> res = await ProductsRepository().getProducts();
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
