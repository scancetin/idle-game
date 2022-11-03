// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../components/crop_plot_components/crop_plot_line.dart';

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
              CropPlotLine(),
              CropPlotLine(),
              CropPlotLine(),
              CropPlotLine(),
              CropPlotLine(),
              CropPlotLine(),
              CropPlotLine(),
              CropPlotLine(),
              CropPlotLine(),
            ],
          ),
        ),
      ],
    );
  }
}
