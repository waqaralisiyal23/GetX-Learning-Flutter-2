import 'package:getxlearning2/FetchAndDisplayAPIData/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static http.Client client = http.Client();

  static Future<List<ProductModel>> fetchProducts() async {
    http.Response response = await client.get(
      Uri.parse(
          'http://makeup-api.herokuapp.com/api/v1/products.json?brand=colourpop'),
    );
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productFromJson(jsonData);
    }
    return [];
  }
}
