import '../../../../data/models/products/nail_polish.dart';

abstract class RProductRepository {
  Future<List<NailPolish>> getProducts();
}
