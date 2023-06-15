import 'package:flutter/material.dart';

import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../models/payment_type_model.dart';

class PaymentTypeFormModal extends StatefulWidget {
  final PaymentTypeModel? model;

  const PaymentTypeFormModal({super.key, required this.model});

  @override
  State<PaymentTypeFormModal> createState() => _PaymentTypeFormModalState();
}

class _PaymentTypeFormModalState extends State<PaymentTypeFormModal> {
  void _closeModal() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    return SingleChildScrollView(
      child: Container(
        width: screenWidth * (screenWidth > 1200 ? .5 : .7),
        padding: const EdgeInsets.all(30),
        child: Form(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.model == null ? 'Adicionar' : 'Editar'} forma de pagamento',
                      textAlign: TextAlign.center,
                      style: context.textStyles.textTitle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: _closeModal,
                      child: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Sigla'),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Ativo:',
                    style: context.textStyles.textRegular,
                  ),
                  Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 60,
                    padding: const EdgeInsets.all(8),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      child: Text(
                        'Cancelar',
                        style: context.textStyles.textExtraBold.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.save),
                      label: const Text('Salvar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
