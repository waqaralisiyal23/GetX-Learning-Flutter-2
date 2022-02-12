import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlearning2/FetchAndDisplayAPIData/controllers/product_controller.dart';
import 'package:getxlearning2/FetchAndDisplayAPIData/views/product_list_view.dart';

class FetchDisplayApiDataScreen extends StatefulWidget {
  @override
  _FetchDisplayApiDataScreenState createState() =>
      _FetchDisplayApiDataScreenState();
}

class _FetchDisplayApiDataScreenState extends State<FetchDisplayApiDataScreen> {
  final ProductController _productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    _productController.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Obx(() {
        if (_productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ProductListView(_productController.productList);
      }),
    );
  }
}
