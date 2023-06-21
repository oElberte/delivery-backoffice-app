import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/helpers/history_back_listener.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import 'menu_button.dart';
import 'menu_enum.dart';

class LeftMenuBar extends StatefulWidget {
  const LeftMenuBar({super.key});

  @override
  State<LeftMenuBar> createState() => _LeftMenuBarState();
}

class _LeftMenuBarState extends State<LeftMenuBar> with HistoryBackListener {
  Menu? selectedMenu;
  bool colapsed = false;

  @override
  void onHistoryBack(Event event) {
    setState(() {
      selectedMenu = Menu.findByPath(Modular.to.path);
    });
    super.onHistoryBack(event);
  }

  @override
  void initState() {
    super.initState();
    selectedMenu = Menu.findByPath(Modular.to.path);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: colapsed ? 90 : context.percentWidth(.18),
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment: colapsed ? Alignment.center : Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                setState(() {
                  colapsed = !colapsed;
                });
              },
              icon: Icon(
                colapsed ? Icons.keyboard_double_arrow_right_outlined : Icons.keyboard_double_arrow_left_outlined,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: Menu.values.length,
            itemBuilder: (context, index) {
              final menu = Menu.values[index];

              return MenuButton(
                menu: menu,
                menuSelected: selectedMenu,
                onPressed: (m) {
                  setState(() {
                    selectedMenu = m;
                    Modular.to.navigate(menu.route);
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
