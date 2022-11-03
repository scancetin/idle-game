// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import '../components/crop_plot_components/crop_plot_line.dart';

class CropPlotLayout extends StatelessWidget {
  const CropPlotLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 120),
      child: ListView(
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
          Container(
            height: 50,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
