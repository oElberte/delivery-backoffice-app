import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/session_storage_impl.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<SessionStorage>(
          (i) => SessionStorageImpl(),
          export: true,
        ),
        Bind.lazySingleton<CustomDio>(
          (i) => CustomDio(i()),
          export: true,
        ),
      ];
}
