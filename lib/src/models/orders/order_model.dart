import 'dart:convert';

import 'order_product_model.dart';
import 'order_status.dart';

class OrderModel {
  final int id;
  final DateTime date;
  final OrderStatus status;
  final List<OrderProductModel> orderProducts;
  final int userId;
  final String address;
  final String cpf;
  final int paymentTypeId;

  OrderModel({
    required this.id,
    required this.date,
    required this.status,
    required this.orderProducts,
    required this.userId,
    required this.address,
    required this.cpf,
    required this.paymentTypeId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.toIso8601String(),
      'status': status.acronym,
      'products': orderProducts.map((x) => x.toMap()).toList(),
      'user_id': userId,
      'address': address,
      'CPF': cpf,
      'payment_method_id': paymentTypeId,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id']?.toInt() ?? 0,
      date: DateTime.parse(map['date']),
      status: OrderStatus.parse(map['status']),
      orderProducts: List<OrderProductModel>.from(map['products']?.map((x) => OrderProductModel.fromMap(x))),
      userId: map['user_id']?.toInt() ?? 0,
      address: map['address'] ?? '',
      cpf: map['cpf'] ?? '',
      paymentTypeId: map['payment_method_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source));
}
