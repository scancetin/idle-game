import 'package:sizer/sizer.dart';

class KCrop {
  static const List<String> cropNames = ["Carrot", "Tomato", "Eggplant", "Red Pepper", "Corn", "Grape", "Strawberry", "Cotton", "Mushroom", "Apple", "Banana", "Pear", "Lemon"];
  static const List<int> cropIds = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  static const List<int> cropPrices = [1, 10, 10, 10, 50, 100, 500, 1000, 5000, 10000, 20000, 50000, 100000];
  // static const List<int> cropPrices = [1, 10, 100, 1000, 5000, 10000, 50000, 100000, 500000, 1000000, , , ];
  static const List<int> cropIncomes = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096];
  static const List<int> powerupsPrices = [32, 64, 128, 256, 512, 1024, 2048, 4096];
  static const List<String> powerupsNames = ["Coin", "Coin", "S Coin", "S Coin", "Water", "Fertilizer", "Growing", "Hourglass"];

  static const List<String> cropImages = [
    "assets/crops/carrot.png",
    "assets/crops/tomato.png",
    "assets/crops/eggplant.png",
    "assets/crops/redpepper.png",
    "assets/crops/corn.png",
    "assets/crops/grape.png",
    "assets/crops/strawberry.png",
    "assets/crops/cotton.png",
    "assets/crops/mushroom.png",
    "assets/crops/apple.png",
    "assets/crops/banana.png",
    "assets/crops/pear.png",
    "assets/crops/lemon.png"
  ];

  static const List<String> powerupsImages = [
    "assets/powerups/coin.png",
    "assets/powerups/coin1.png",
    "assets/powerups/scoin.png",
    "assets/powerups/scoin1.png",
    "assets/powerups/water.png",
    "assets/powerups/fertilizer.png",
    "assets/powerups/growing.png",
    "assets/powerups/hourglass.png",
  ];

  static const List<String> guiImages = [
    "assets/gui/inventory.png",
    "assets/gui/tofield.png",
  ];
}

class KMessages {}

class KSizer {
  static final double appBarH = 7.h;
  static final double setIconS = 3.3.h;
  static final double pointH = 3.3.h;
  static final double pointW = 10.h;
  static final double pointSizedBoxW = 3.w;
  static final double pointTextS = 8.sp;

  static final double cropPlotSize = 22.w;

  static final double cropPaddingB = 20.h;
  static final double cropPaddingT = 10.h;
  static final double cropAddIcon = 10.h;

  static final double textButtonSize = 12.sp;

  static final double panelMinH = 10.h;
  static final double panelMaxH = 70.h;
  static final double panelMenuH = 10.h - 8;
  static final double panelMenuTextS = 11.sp;

  static final double panelLevelUpH = panelMaxH - panelMinH;
  static final double panelListTileH = 7.h;
  static final double panelCropImage = 6.h;
  static final double panelLevelUpCardW = 20.w;

  static final double alertDialogH = 40.h;
  static final double alertDialogW = 80.w;
}
