import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tast_for_mobix/features/products/data/model/produtModel.dart';

import '../data/repository/product_repository.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  late final List<ProductModel> productData;
  final ProductRepository productRepository = ProductRepository();

  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>(getProduct);
    on<SearchProductEvent>(filterTheData);
  }

  /// Get Product into respository

  Future<void> getProduct(
    GetProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final result = await productRepository.getProductData();
      productData = result;
      emit(ProductLoaded(data: productData));
    } catch (e) {
      print("[getProduct Method eror $e");
      emit(ProductError(message: "$e"));
    }
  }


  void filterTheData(SearchProductEvent event,Emitter<ProductState> emit){
    print("Event Valiue is ${event.searchText.toString()}");
    List<ProductModel> filteredData = productData.where((element) => element.title.toLowerCase().toString()
        .contains(event.searchText.toLowerCase().toString()),).toList();

    emit(ProductLoaded(data:  filteredData));
  }

}
