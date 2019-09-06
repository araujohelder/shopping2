import 'package:shopping_2/models/category.model.dart';

class ProductDetailModel {
  String id;
  String title;
  String tag;
  double price;
  String description;
  String brand;
  List<String> images;
  CategoryModel category;

  ProductDetailModel(
      {this.id,
      this.title,
      this.tag,
      this.price,
      this.description,
      this.brand,
      this.images,
      this.category});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    tag = json['tag'];
    price = json['price'];
    description = json['description'];
    brand = json['brand'];
    images = json['images'].cast<String>();
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['tag'] = this.tag;
    data['price'] = this.price;
    data['description'] = this.description;
    data['brand'] = this.brand;
    data['images'] = this.images;
    data['category'] = this.category;
    return data;
  }
}
