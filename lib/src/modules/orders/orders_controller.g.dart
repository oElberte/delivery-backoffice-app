// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrdersController on OrdersControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'OrdersControllerBase._status', context: context);

  OrdersStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  OrdersStateStatus get _status => status;

  @override
  set _status(OrdersStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'OrdersControllerBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_statusFilterAtom =
      Atom(name: 'OrdersControllerBase._statusFilter', context: context);

  OrderStatus? get statusFilter {
    _$_statusFilterAtom.reportRead();
    return super._statusFilter;
  }

  @override
  OrderStatus? get _statusFilter => statusFilter;

  @override
  set _statusFilter(OrderStatus? value) {
    _$_statusFilterAtom.reportWrite(value, super._statusFilter, () {
      super._statusFilter = value;
    });
  }

  late final _$_ordersAtom =
      Atom(name: 'OrdersControllerBase._orders', context: context);

  List<OrderModel> get orders {
    _$_ordersAtom.reportRead();
    return super._orders;
  }

  @override
  List<OrderModel> get _orders => orders;

  @override
  set _orders(List<OrderModel> value) {
    _$_ordersAtom.reportWrite(value, super._orders, () {
      super._orders = value;
    });
  }

  late final _$_selectedModelAtom =
      Atom(name: 'OrdersControllerBase._selectedModel', context: context);

  OrderModel? get selectedModel {
    _$_selectedModelAtom.reportRead();
    return super._selectedModel;
  }

  @override
  OrderModel? get _selectedModel => selectedModel;

  @override
  set _selectedModel(OrderModel? value) {
    _$_selectedModelAtom.reportWrite(value, super._selectedModel, () {
      super._selectedModel = value;
    });
  }

  late final _$findOrdersAsyncAction =
      AsyncAction('OrdersControllerBase.findOrders', context: context);

  @override
  Future<void> findOrders() {
    return _$findOrdersAsyncAction.run(() => super.findOrders());
  }

  late final _$showDetailModalAsyncAction =
      AsyncAction('OrdersControllerBase.showDetailModal', context: context);

  @override
  Future<void> showDetailModal(OrderModel model) {
    return _$showDetailModalAsyncAction.run(() => super.showDetailModal(model));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
