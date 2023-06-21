import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/product_model.dart';
import './product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final CustomDio _dio;

  ProductRepositoryImpl(this._dio);

  @override
  Future<void> deleteProduct(int id) async {
    try {
      await _dio.auth().put(
        '/products/$id',
        data: {
          'enabled': false,
        },
      );
    } on DioError catch (e, s) {
      log('Erro ao deletar o produto', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao deletar o produto');
    }
  }

  @override
  Future<List<ProductModel>> findAll(String? name) async {
    try {
      final productResult = await _dio.auth().get(
        '/products',
        queryParameters: {
          if (name != null) 'name': name,
          'enabled': true,
        },
      );

      return productResult.data
          .map<ProductModel>(
            (p) => ProductModel.fromMap(p),
          )
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produtos');
    }
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    try {
      final productResult = await _dio.auth().get(
            '/products/$id',
          );

      return ProductModel.fromMap(productResult.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar produto $id', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produto $id');
    }
  }

  @override
  Future<void> save(ProductModel product) async {
    try {
      final client = _dio.auth();
      final data = product.toMap();

      if (product.id != null) {
        await client.put('/products/${product.id}', data: data);
      } else {
        await client.post('/products', data: data);
      }
    } on DioError catch (e, s) {
      log('Erro ao salvar produto', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao salvar produto');
    }
  }

  @override
  Future<String> uploadImageProduct(Uint8List file, String fileName) async {
    try {
      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(file, filename: fileName),
      });

      final response = await _dio.auth().post('/uploads', data: formData);

      return response.data['url'];
    } on DioError catch (e, s) {
      log('Erro ao fazer upload do arquivo', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao fazer upload do arquivo');
    }
  }
}
