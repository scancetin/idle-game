import 'package:flutter/material.dart';
import 'crop_plot.dart';

class CropPlotLine extends StatelessWidget {
  final int cropLineNo;
  final int currentPlot;
  const CropPlotLine({super.key, required this.cropLineNo, required this.currentPlot});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CropPlot(plotId: cropLineNo * 3 + 0 + currentPlot * 12),
        CropPlot(plotId: cropLineNo * 3 + 1 + currentPlot * 12),
        CropPlot(plotId: cropLineNo * 3 + 2 + currentPlot * 12),
      ],
    );
  }
}
