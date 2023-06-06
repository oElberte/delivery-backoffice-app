import '../../models/payment_type_model.dart';

abstract class PaymentTypeRepository {
  Future<List<PaymentTypeModel>> findAll(bool? enabled);
  Future<PaymentTypeModel> getById(int id);
  Future<void> save(PaymentTypeModel model);
}