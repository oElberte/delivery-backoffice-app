import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/payment_type_model.dart';
import './payment_type_repository.dart';

class PaymentTypeRepositoryImpl implements PaymentTypeRepository {
  final CustomDio _dio;

  PaymentTypeRepositoryImpl(this._dio);

  @override
  Future<List<PaymentTypeModel>> findAll(bool? enabled) async {
    try {
      final paymentResult = await _dio.auth().get(
        '/payment-types',
        queryParameters: {
          if (enabled != null) 'enabled': enabled,
        },
      );
      return paymentResult.data.map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p)).toList();
    } on DioError catch (e, s) {
      const message = 'Erro ao buscar formas de pagamento';

      log(message, error: e, stackTrace: s);
      throw RepositoryException(message: message);
    }
  }

  @override
  Future<PaymentTypeModel> getById(int id) async {
    try {
      final paymentResult = await _dio.auth().get('/payment-types/$id');
      return PaymentTypeModel.fromMap(paymentResult.data);
    } on DioError catch (e, s) {
      final message = 'Erro ao buscar forma de pagamento $id';

      log(message, error: e, stackTrace: s);
      throw RepositoryException(message: message);
    }
  }

  @override
  Future<void> save(PaymentTypeModel model) async {
    try {
      final client = _dio.auth();

      if (model.id != null) {
        await client.put(
              '/payment-types/${model.id}',
              data: model.toMap(),
            );
      } else {
        await client.post(
              '/payment-types',
              data: model.toMap(),
            );
      }
    } on DioError catch (e, s) {
      const message = 'Erro ao salvar ou atualizar forma de pagamento';

      log(message, error: e, stackTrace: s);
      throw RepositoryException(message: message);
    }
  }
}
