import 'package:dio/dio.dart';
import 'package:shopping_2/models/product-detail.model.dart';
import 'package:shopping_2/models/product-list-item.model.dart';
import 'package:shopping_2/settings.dart';

class ProductRepository {
  Future<List<ProductListItemModel>> getAll() async {
    var url = "${Settings.apiUrl}v1/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => ProductListItemModel.fromJson(course))
        .toList();
  }

  Future<List<ProductListItemModel>> getByCategory(String category) async {
    var url = "${Settings.apiUrl}v1/categories/$category/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => ProductListItemModel.fromJson(course))
        .toList();
  }

  Future<ProductDetailModel> get(String tag) async {
    var url = "${Settings.apiUrl}v1/products/$tag";
    Response response = await Dio().get(url);
    return ProductDetailModel.fromJson(response.data);
  }
}
