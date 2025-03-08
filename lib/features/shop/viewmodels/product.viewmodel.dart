import 'package:flutter/material.dart';
import 'package:t_store/features/shop/models/product.model.dart';
import 'package:t_store/utils/http/endpoints.dart';
import 'package:t_store/utils/http/http_client.dart';

class ProductViewModel extends ChangeNotifier {
  bool _isProductLoading = false;
  bool get isProductLoading => _isProductLoading;

  List<Product> _products = [];
  List<Product> get products => _products;

  List<Category> _categories = [];
  List<Category> get categories => _categories;
  bool _isError = false;
  bool get isError => _isError;

  loadProducts() async {
    try {
      _isProductLoading = true;

      var data = await THttpHelper.get(Endpoints.PRODUCTS);
      var categories = await THttpHelper.get(Endpoints.GET_CATEGORY);

      _products = data['data']
          .map<Product>((product) => Product.fromJson(product))
          .toList();

      _categories = categories['data']
          .map<Category>((category) => Category.fromJson(category))
          .toList();

      _isProductLoading = false;
      notifyListeners();
    } catch (err, strackTrace) {
      print(err);
      print(strackTrace);

      _isProductLoading = false;
      _isError = true;
      notifyListeners();
    }
  }
}
