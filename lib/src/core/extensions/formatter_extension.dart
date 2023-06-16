import 'package:brasil_fields/brasil_fields.dart';

extension FormatterExtension on double {
  String get currencyPTBR => UtilBrasilFields.obterReal(this);
}