import 'package:flutter_modular/flutter_modular.dart';

import 'orders_page.dart';

class OrdersModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const OrderPage(),
        ),
      ];
}
