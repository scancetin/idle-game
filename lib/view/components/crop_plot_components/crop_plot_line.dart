import 'package:flutter/material.dart';
import 'crop_plot.dart';

class CropPlotLine extends StatelessWidget {
  final int cropLineNo;
  const CropPlotLine({super.key, required this.cropLineNo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CropPlot(plotId: cropLineNo * 3 + 0),
        CropPlot(plotId: cropLineNo * 3 + 1),
        CropPlot(plotId: cropLineNo * 3 + 2),
      ],
    );
  }
}
