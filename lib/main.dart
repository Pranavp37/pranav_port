import 'package:flutter/material.dart';
import 'package:motion/motion.dart';
import 'package:pranav_portfolio/views/main_screen.dart';

void main() async {
  await Motion.instance.initialize();
  Motion.instance.setUpdateInterval(60.fps);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
