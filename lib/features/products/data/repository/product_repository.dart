import 'package:tast_for_mobix/core/constants/constant_Values.dart';
import 'package:tast_for_mobix/core/network/api_service.dart';

import '../../../../core/exceptionHandler/repository_handler.dart';
import '../model/produtModel.dart';

class ProductRepository {
  final ApiService apiService = ApiService();

  Future<List<ProductModel>> getProductData() async {
    try {
      final responseData = await apiService.getMethod(url: baseUrl);
      RepositoryHandler.handleTheResponse(responseData.statusCode ?? 0);

      List<dynamic> data = responseData.data;
      final List<ProductModel> productModelData = data
          .map((e) => ProductModel.fromJson(e))
          .toList();

      print("Product list of data printed here ${productModelData.length}");
      return productModelData;
    }  catch (e) {
      print("[getProductData method error is $e]");
      rethrow;
    }
  }
}
