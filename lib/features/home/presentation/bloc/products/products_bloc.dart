import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/models/products/nail_polish.dart';
import '../../../domain/usecases/get_products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsGet>((event, emit) async {
      emit(ProductsLoading());
      GetProducts getProducts = GetProducts();
      List<NailPolish> res = await getProducts();
      await Future.delayed(const Duration(seconds: 1));
      emit(ProductsCharged(products: res));
    });
  }
}
