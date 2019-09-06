import 'package:shopping_2/models/category-list-item.model.dart';
import 'package:shopping_2/models/product-list-item.model.dart';
import 'package:shopping_2/repositories/category.repository.dart';
import 'package:shopping_2/repositories/product.repository.dart';
import 'package:flutter/widgets.dart';

class HomeBloc extends ChangeNotifier {
  final CategoryRepository categoryRepository = new CategoryRepository();
  final ProductRepository productRepository = new ProductRepository();

  List<ProductListItemModel> products;
  List<CategoryListItemModel> categories;
  String selectedCategory = 'todos';

  HomeBloc() {
    getCategories();
    getProducts();
  }

  getCategories() {
    categoryRepository.getAll().then((data) {
      this.categories = data;
      notifyListeners();
    });
  }

  getProducts() {
    productRepository.getAll().then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  getProductsByCategory() {
    productRepository.getByCategory(selectedCategory).then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  changeCategory(tag) {
    selectedCategory = tag;
    products = null;
    getProductsByCategory();
    notifyListeners();
  }
}
