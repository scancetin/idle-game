// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'crop_plot.dart';

class CropPlotLine extends StatelessWidget {
  final int cropLineNo;
  const CropPlotLine({super.key, required this.cropLineNo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 3 - 20,
      child: Row(
        children: [
          Expanded(child: CropPlot(plotId: cropLineNo * 3 + 1)),
          Expanded(child: CropPlot(plotId: cropLineNo * 3 + 2)),
          Expanded(child: CropPlot(plotId: cropLineNo * 3 + 3)),
        ],
      ),
    );
  }
}
