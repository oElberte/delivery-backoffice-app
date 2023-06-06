
import 'package:dio/dio.dart';

import '../../global/constants.dart';
import '../../global/global_context.dart';
import '../../storage/session_storage.dart';

class AuthInterceptor extends Interceptor {
  final SessionStorage _storage;

  AuthInterceptor(this._storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _storage.getData(SessionStorageKeys.accessToken.key);
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      GlobalContext.instance.loginExpired();
    } else {
      handler.next(err);
    }
  }
}