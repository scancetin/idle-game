// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'crop_plot.dart';

class CropPlotLine extends StatelessWidget {
  const CropPlotLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 3 - 20,
      // width: MediaQuery.of(context).size.width / 3,
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Expanded(child: CropPlot()),
          Expanded(child: CropPlot()),
          Expanded(child: CropPlot()),
        ],
      ),
    );
  }
}
