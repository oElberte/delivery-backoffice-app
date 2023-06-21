import '../../models/orders/order_model.dart';
import '../../models/orders/order_status.dart';

abstract class OrderRepository {
  Future<List<OrderModel>> findAll(DateTime date, [OrderStatus? status]);
  Future<OrderModel> findById(int id);
  Future<void> changeStatus(int id, OrderStatus status);
}