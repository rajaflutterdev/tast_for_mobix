part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<ProductModel> data;

  ProductLoaded({required this.data});
}

final class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}
