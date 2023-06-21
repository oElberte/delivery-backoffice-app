import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../models/orders/order_model.dart';
import '../../models/orders/order_status.dart';
import '../../repositories/order/order_repository.dart';
part 'orders_controller.g.dart';

enum OrdersStateStatus {
  initial,
  loading,
  loaded,
  error,
  showDetailModal,
}

class OrdersController = OrdersControllerBase with _$OrdersController;

abstract class OrdersControllerBase with Store {
  final OrderRepository _orderRepository;

  @readonly
  var _status = OrdersStateStatus.initial;

  @readonly
  String? _errorMessage;

  late final DateTime _today;

  @readonly
  OrderStatus? _statusFilter;

  @readonly
  var _orders = <OrderModel>[];

  @readonly
  OrderModel? _selectedModel;

  OrdersControllerBase(this._orderRepository) {
    final now = DateTime.now();
    _today = DateTime(now.year, now.month, now.day);
  }

  @action
  Future<void> findOrders() async {
    try {
      _status = OrdersStateStatus.loading;
      _orders = await _orderRepository.findAll(_today, _statusFilter);
      _status = OrdersStateStatus.loaded;
    } catch (e, s) {
      _errorMessage = 'Erro ao buscar pedidos do dia';

      _status = OrdersStateStatus.error;
      log(_errorMessage!, error: e, stackTrace: s);
    }
  }

  @action
  Future<void> showDetailModal(OrderModel model) async {
    _status = OrdersStateStatus.loading;
    await Future.delayed(Duration.zero);
    _status = OrdersStateStatus.showDetailModal;
  }
}
