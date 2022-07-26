part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsCharged extends ProductsState {
  final List<NailPolish> products;

  const ProductsCharged({required this.products});
}
