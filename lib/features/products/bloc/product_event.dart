part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class GetProductEvent extends ProductEvent {
  GetProductEvent();
}
class SearchProductEvent extends ProductEvent {
  final String searchText;
  SearchProductEvent({required this.searchText});
}

class SearchShowEvent extends ProductEvent {
  final bool show;
  SearchShowEvent({required this.show});
}

