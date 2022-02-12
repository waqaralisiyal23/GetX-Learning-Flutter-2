import 'package:get/state_manager.dart';
import 'package:getxlearning2/FetchAndDisplayAPIData/apimodule/api_service.dart';
import 'package:getxlearning2/FetchAndDisplayAPIData/models/product_model.dart';

class ProductController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<ProductModel> productList = RxList<ProductModel>();

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      List<ProductModel> products = await ApiService.fetchProducts();
      if (products.length > 0) productList.assignAll(products);
    } finally {
      isLoading(false);
    }
  }
}
