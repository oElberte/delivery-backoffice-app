import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../dto/order/order_dto.dart';
import '../../models/orders/order_model.dart';
import '../../models/orders/order_status.dart';
import '../../repositories/order/order_repository.dart';
import '../../services/order/get_order_by_id.dart';
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
  final GetOrderById _getOrderById;

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

  @readonly
  OrderDto? _orderSelected;

  OrdersControllerBase(this._orderRepository, this._getOrderById) {
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
    _orderSelected = await _getOrderById(model);
    _status = OrdersStateStatus.showDetailModal;
  }
}
