// ignore_for_file: prefer_const_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:idle_game/model/user_shared_prefs.dart';
import 'package:provider/provider.dart';

class CropPlot extends StatelessWidget {
  const CropPlot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserSimplePrefs>(builder: (context, model, child) {
      return GestureDetector(
        child: Card(
          color: Colors.purple,
          child: Container(),
        ),
        onTap: () {
          model.setCoin(1);
          model.nextLvlCheck();
        },
      );
    });
  }
}
