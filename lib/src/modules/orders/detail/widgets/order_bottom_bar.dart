import 'package:flutter/material.dart';

import '../../../../core/ui/styles/text_styles.dart';

class OrderBottomBar extends StatelessWidget {
  const OrderBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OrderBottomBarButton(
          label: 'FINALIZAR',
          iconPath: 'assets/images/icons/finish_order_white_ico.png',
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          color: Colors.blue,
        ),
        OrderBottomBarButton(
          label: 'CONFIRMAR',
          iconPath: 'assets/images/icons/confirm_order_white_icon.png',
          borderRadius: BorderRadius.all(Radius.zero),
          color: Colors.green,
        ),
        OrderBottomBarButton(
          label: 'CANCELAR',
          iconPath: 'assets/images/icons/cancel_order_white_icon.png',
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.red,
        ),
      ],
    );
  }
}

class OrderBottomBarButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final BorderRadius borderRadius;
  final Color color;

  const OrderBottomBarButton({
    super.key,
    required this.label,
    required this.iconPath,
    required this.borderRadius,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            side: BorderSide(
              color: color,
            ),
            backgroundColor: color,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconPath),
              const SizedBox(width: 5),
              Text(
                label,
                style: context.textStyles.textBold.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
