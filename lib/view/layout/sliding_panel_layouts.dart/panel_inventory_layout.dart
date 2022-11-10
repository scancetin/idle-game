// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:idle_game/util/constants.dart';
import 'package:provider/provider.dart';

class PanelInventoryLayout extends StatelessWidget {
  const PanelInventoryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    CropController cropCon = CropController(context);

    return Container(
      height: KSizer.panelLevelUpH,
      color: Colors.blue,
      child: Consumer<CropModel>(builder: (context, cropModel, child) {
        return ListView.builder(
          itemCount: cropCon.invSize() ?? 0,
          itemBuilder: (context, index) {
            return Card(
                child: Container(
              height: 50,
              color: Colors.red,
              child: Row(
                children: [
                  Text(KCrop.cropNames[cropCon.invCrop(index)]),
                  Spacer(),
                  Text(cropCon.invLevel(index)),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        cropCon.deleteFromInventory(index);
                      },
                      icon: Icon(Icons.upcoming)),
                ],
              ),
            ));
          },
        );
      }),
    );
  }
}
