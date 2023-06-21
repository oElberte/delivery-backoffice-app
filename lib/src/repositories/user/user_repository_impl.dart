import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/user_model.dart';
import './user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final CustomDio _dio;

  UserRepositoryImpl(this._dio);

  @override
  Future<UserModel> getById(int id) async {
    try {
      final userResponse = await _dio.auth().get('/users/$id');

      return UserModel.fromMap(userResponse.data);
    } on DioError catch (e, s) {
      const errorMessage = 'Erro ao buscar o usuário';
      
      log(errorMessage, error: e, stackTrace: s);
      throw RepositoryException(message: errorMessage);
    }
  }
}
