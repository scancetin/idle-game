import 'package:flutter/material.dart';
import 'package:idle_game/util/constants.dart';
import 'package:idle_game/view/layout/sliding_panel_layouts.dart/panel_decorations_layout.dart';
import 'package:idle_game/view/layout/sliding_panel_layouts.dart/panel_inventory_layout.dart';
import 'package:idle_game/view/layout/sliding_panel_layouts.dart/panel_levelup_layout.dart';
import 'package:idle_game/view/layout/sliding_panel_layouts.dart/panel_power_ups_layout.dart';

class SlidingPanelLayout extends StatefulWidget {
  const SlidingPanelLayout({Key? key}) : super(key: key);

  @override
  State<SlidingPanelLayout> createState() => _SlidingPanelLayoutState();
}

class _SlidingPanelLayoutState extends State<SlidingPanelLayout> {
  Widget _menuWidget = const PanelLevelUpLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            //! level up corps
            panelMenuWidget("Corps", const PanelLevelUpLayout()),

            //! inventory
            panelMenuWidget("Inventory", const PanelInventoryLayout()),

            //! decorations
            panelMenuWidget("Decorations", const PanelDecorationsLayout()),

            //! power-ups
            panelMenuWidget("Power-Ups", const PanelPowerUpsLayout()),
          ],
        ),
        _menuWidget
      ],
    );
  }

  Widget panelMenuWidget(String menuName, Widget menuTab) {
    return Expanded(
      child: GestureDetector(
        child: Card(
          color: Colors.red,
          child: Container(
            height: KSizer.panelMenuH,
            alignment: Alignment.center,
            child: Text(menuName, style: TextStyle(fontSize: KSizer.panelMenuTextS)),
          ),
        ),
        onTap: () {
          setState(() {
            _menuWidget = menuTab;
          });
        },
      ),
    );
  }
}
