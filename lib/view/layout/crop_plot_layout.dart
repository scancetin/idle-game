// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:provider/provider.dart';
import '../components/crop_plot_components/crop_plot_line.dart';

class CropPlotLayout extends StatelessWidget {
  const CropPlotLayout({super.key});

  @override
  Widget build(BuildContext context) {
    CropController cropCon = CropController(context);

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 120),
      child: Consumer<CropModel>(builder: (context, model, child) {
        return ListView.builder(
            itemCount: cropCon.plotSize(),
            itemBuilder: (context, index) {
              return CropPlotLine(cropLineNo: index);
            });
      }),
    );
  }
}
