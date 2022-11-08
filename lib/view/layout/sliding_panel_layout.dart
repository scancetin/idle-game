// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class SlidingPanelLayout extends StatelessWidget {
  const SlidingPanelLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Card(color: Colors.red, child: Container(height: 70))),
            Expanded(child: Card(color: Colors.red, child: Container(height: 70))),
            Expanded(child: Card(color: Colors.red, child: Container(height: 70))),
            Expanded(child: Card(color: Colors.red, child: Container(height: 70))),
          ],
        ),
        Container(
          height: 422,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // CropPlotLine(cropLineNo: 0),
              // CropPlotLine(cropLineNo: 1),
              // CropPlotLine(cropLineNo: 2),
              // CropPlotLine(cropLineNo: 3),
              // CropPlotLine(cropLineNo: 4),
              // CropPlotLine(cropLineNo: 5),
              // CropPlotLine(cropLineNo: 6),
              // CropPlotLine(cropLineNo: 7),
              // CropPlotLine(cropLineNo: 8),
            ],
          ),
        ),
      ],
    );
  }
}
