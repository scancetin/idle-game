import 'package:sizer/sizer.dart';

class KCrop {
  static const List<String> cropNames = ["potato", "carrot", "tomato", "sunflower", "blueberry", "pumpkin", "strawberry", "corn", "eggplant", "watermelon"];
  static const List<int> cropIds = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  static const List<int> cropPrices = [1, 10, 10, 10, 50, 100, 500, 1000, 5000, 10000];
  // static const List<int> cropPrices = [1, 10, 100, 1000, 5000, 10000, 50000, 100000, 500000, 1000000];
  static const List<int> cropIncomes = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512];
}

class KMessages {}

class KSizer {
  static final double appBarH = 7.h;
  static final double setIconS = 3.3.h;
  static final double pointH = 3.3.h;
  static final double pointW = 10.h;
  static final double pointSizedBoxW = 2.h;
  static final double pointTextS = 8.sp;

  static final double cropPlotSize = 25.w;
  static final double cropPaddingB = 20.h;
  static final double cropPaddingT = 5.h;

  static final double textButtonSize = 12.sp;

  static final double panelMinH = 10.h;
  static final double panelMaxH = 70.h;
}
