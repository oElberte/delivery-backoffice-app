import 'package:flutter/material.dart';

import '../../../../core/ui/styles/text_styles.dart';
import '../../../../dto/order/order_dto.dart';
import '../../../../models/orders/order_status.dart';
import '../../orders_controller.dart';

class OrderBottomBar extends StatelessWidget {
  final OrdersController controller;
  final OrderDto order;
  const OrderBottomBar({
    super.key,
    required this.controller,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OrderBottomBarButton(
          label: 'FINALIZAR',
          iconPath: 'assets/images/icons/finish_order_white_ico.png',
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          color: Colors.blue,
          onPressed: order.status == OrderStatus.confirmed ? () => controller.changeStatus(OrderStatus.finished) : null,
        ),
        OrderBottomBarButton(
          label: 'CONFIRMAR',
          iconPath: 'assets/images/icons/confirm_order_white_icon.png',
          borderRadius: BorderRadius.zero,
          color: Colors.green,
          onPressed: order.status == OrderStatus.pending ? () => controller.changeStatus(OrderStatus.confirmed) : null,
        ),
        OrderBottomBarButton(
          label: 'CANCELAR',
          iconPath: 'assets/images/icons/cancel_order_white_icon.png',
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.red,
          onPressed: order.status != OrderStatus.cancelled && order.status != OrderStatus.finished
              ? () => controller.changeStatus(OrderStatus.cancelled)
              : null,
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
  final VoidCallback? onPressed;

  const OrderBottomBarButton({
    super.key,
    required this.label,
    required this.iconPath,
    required this.borderRadius,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            side: BorderSide(
              color: onPressed != null ? color : Colors.transparent,
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
