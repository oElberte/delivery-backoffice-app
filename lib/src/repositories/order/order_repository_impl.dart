import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/orders/order_model.dart';
import '../../models/orders/order_status.dart';
import './order_repository.dart';

class OrderRepositoryImpl extends OrderRepository {
  final CustomDio _dio;

  OrderRepositoryImpl(this._dio);

  @override
  Future<void> changeStatus(int id, OrderStatus status) async {
    try {
      await _dio.auth().put(
        '/orders/$id',
        data: {
          'status': status.acronym,
        },
      );
    } on DioError catch (e, s) {
      final errorMessage = 'Erro ao alterar status do pedido para ${status.acronym}';

      log(errorMessage, error: e, stackTrace: s);
      throw RepositoryException(message: errorMessage);
    }
  }

  @override
  Future<List<OrderModel>> findAll(DateTime date, [OrderStatus? status]) async {
    try {
      final orderResponse = await _dio.auth().get(
        '/orders',
        queryParameters: {
          'date': date.toIso8601String(),
          if (status != null) 'status': status.acronym,
        },
      );
      return orderResponse.data
          .map<OrderModel>(
            (o) => OrderModel.fromMap(o),
          )
          .toList();
    } on DioError catch (e, s) {
      const errorMessage = 'Erro ao buscar pedidos';

      log(errorMessage, error: e, stackTrace: s);
      throw RepositoryException(message: errorMessage);
    }
  }

  @override
  Future<OrderModel> findById(int id) async {
    try {
      final orderResponse = await _dio.auth().get(
            '/orders/$id',
          );
      return OrderModel.fromMap(orderResponse.data);
    } on DioError catch (e, s) {
      const errorMessage = 'Erro ao buscar pedido';

      log(errorMessage, error: e, stackTrace: s);
      throw RepositoryException(message: errorMessage);
    }
  }
}
