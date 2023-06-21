import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import 'detail/order_detail_modal.dart';
import 'orders_controller.dart';
import 'widgets/order_header.dart';
import 'widgets/order_item.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with Loader, Messages {
  final controller = Modular.get<OrdersController>();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case OrdersStateStatus.initial:
            break;
          case OrdersStateStatus.loading:
            showLoader();
            break;
          case OrdersStateStatus.loaded:
            hideLoader();
            break;
          case OrdersStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro interno');
            break;
          case OrdersStateStatus.showDetailModal:
            hideLoader();
            showOrderDetail();
            break;
        }
      });
      controller.findOrders();
    });
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  void showOrderDetail() {
    showDialog(
      context: context,
      builder: (context) {
        return const OrderDetailModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Container(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              const OrderHeader(),
              const SizedBox(height: 50),
              Expanded(
                child: Observer(
                  builder: (_) {
                    return GridView.builder(
                      itemCount: controller.orders.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 91,
                        maxCrossAxisExtent: 600,
                      ),
                      itemBuilder: (context, index) {
                        return OrderItem(
                          order: controller.orders[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
