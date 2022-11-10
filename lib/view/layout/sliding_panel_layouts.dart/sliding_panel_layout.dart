// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

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
  Widget menuWidget = PanelLevelUpLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            //! level up corps
            panelMenuWidget("Corps", PanelLevelUpLayout()),

            //! inventory
            panelMenuWidget("Inventory", PanelInventoryLayout()),

            //! decorations
            panelMenuWidget("Decorations", PanelDecorationsLayout()),

            //! power-ups
            panelMenuWidget("Power-Ups", PanelPowerUpsLayout()),
          ],
        ),
        menuWidget
        // Container(
        //   height: 422,
        //   padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
        //   child: ListView(
        //     // ignore: prefer_const_literals_to_create_immutables
        //     children: [],
        //   ),
        // ),
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
            child: Text(menuName, style: TextStyle(fontSize: KSizer.pointTextS)),
          ),
        ),
        onTap: () {
          setState(() {
            menuWidget = menuTab;
          });
        },
      ),
    );
  }
}
