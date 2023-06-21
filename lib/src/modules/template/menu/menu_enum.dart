enum Menu {
  paymentType(
    route: '/payment-type/',
    assetIcon: 'payment_type_ico.png',
    assetIconSelected: 'payment_type_ico_selected.png',
    label: 'Administrar formas de pagamento',
  ),

  products(
    route: '/products/',
    assetIcon: 'product_ico.png',
    assetIconSelected: 'product_ico_selected.png',
    label: 'Administrar produtos',
  ),

  orders(
    route: '/orders/',
    assetIcon: 'order_ico.png',
    assetIconSelected: 'order_ico_selected.png',
    label: 'Pedidos do dia',
  );

  final String route;
  final String assetIcon;
  final String assetIconSelected;
  final String label;

  const Menu({
    required this.route,
    required this.assetIcon,
    required this.assetIconSelected,
    required this.label,
  });

  static Menu? findByPath(String path) {
    final menu = Menu.values.where((element) => path.contains(element.route));

    if (menu.isNotEmpty) {
      return menu.first;
    }
    return null;
  }
}
