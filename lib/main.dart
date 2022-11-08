import 'package:flutter/material.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:idle_game/view/home_view.dart';
import 'package:provider/provider.dart';
import 'model/user_stats_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserStatsModel.init();
  await CropModel.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserStatsModel()),
        ChangeNotifierProvider(create: (_) => CropModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idle Farm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}
