import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../models/product_model.dart';
import '../../../repositories/products/product_repository.dart';
part 'products_controller.g.dart';

enum ProductsStateStatus {
  initial,
  loading,
  loaded,
  error,
  addOrUpdateProduct,
}

class ProductsController = ProductsControllerBase with _$ProductsController;

abstract class ProductsControllerBase with Store {
  final ProductRepository _productRepository;

  ProductsControllerBase(this._productRepository);

  @readonly
  var _status = ProductsStateStatus.initial;

  @readonly
  var _products = <ProductModel>[];

  @readonly
  String? _filterName;

  @readonly
  ProductModel? _productSelected;

  @action
  Future<void> loadProducts() async {
    try {
      _status = ProductsStateStatus.loading;
      _products = await _productRepository.findAll(_filterName);
      _status = ProductsStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      _status = ProductsStateStatus.error;
    }
  }

  @action
  Future<void> filterByName(String name) async {
    _filterName = name;
    await loadProducts();
  }

  @action
  Future<void> addProduct() async {
    _status = ProductsStateStatus.loading;
    await Future.delayed(Duration.zero);
    _productSelected = null;
    _status = ProductsStateStatus.addOrUpdateProduct;
  }

  @action
  Future<void> editProduct(ProductModel productModel) async {
    _status = ProductsStateStatus.loading;
    await Future.delayed(Duration.zero);
    _productSelected = productModel;
    _status = ProductsStateStatus.addOrUpdateProduct;
  }
}
