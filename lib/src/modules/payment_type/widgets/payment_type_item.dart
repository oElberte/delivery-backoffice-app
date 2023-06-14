import 'package:flutter/material.dart';

import '../../../core/ui/styles/text_styles.dart';
import '../../../models/payment_type_model.dart';

class PaymentTypeItem extends StatelessWidget {
  final PaymentTypeModel payment;

  const PaymentTypeItem({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(
              'assets/images/icons/payment_${payment.acronym}_icon.png',
              errorBuilder: (_, __, ___) {
                return Image.asset('assets/images/icons/payment_notfound_icon.png');
              },
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forma de pagamento',
                  style: context.textStyles.textRegular,
                ),
                const SizedBox(height: 10),
                Text(
                  payment.name,
                  style: context.textStyles.textTitle,
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Editar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
