import 'package:flutter/material.dart';
import 'package:getxlearning2/FetchAndDisplayAPIData/models/product_model.dart';

class ProductListView extends StatelessWidget {
  final List<ProductModel> productList;

  ProductListView(this.productList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                Container(
                  width: 150,
                  height: 100,
                  margin: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      productList[index].imageLink!,
                      width: 150,
                      height: 100,
                      fit: BoxFit.fill,
                      color: Colors.purple,
                      colorBlendMode: BlendMode.color,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        productList[index].name!,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        productList[index].brand!,
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                      Text(
                        productList[index].category!,
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(color: Colors.grey[200], height: 2.0),
          ],
        );
      },
    );
  }
}
