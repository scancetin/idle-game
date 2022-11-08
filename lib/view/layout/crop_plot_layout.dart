// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:provider/provider.dart';
import '../components/crop_plot_components/crop_plot_line.dart';

class CropPlotLayout extends StatelessWidget {
  const CropPlotLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CropModel>(builder: (context, model, child) {
      return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 120),
        child: ListView.builder(
            itemCount: model.plotSize,
            itemBuilder: (context, index) {
              return CropPlotLine(cropLineNo: index);
            }),
        // provider ile crop ekleme -- bir sonraki plot için + simgesi gösterilir, sonrakiler soluk renkte gösterilir.
        // model'e List<int> değişkeni eklenip bu değişkene var olan cropların id'si eklenir boş croplar için null değeri? ve verilebilir.
        // cropLineNo * 3 + line'daki sırası ile cropPlotLine no'suna ulaşılır.
      );
    });
  }
}
