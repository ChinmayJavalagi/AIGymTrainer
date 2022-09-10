import 'package:ai_gym_trainer/onbording_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tensorflow Lite',
      home: OnBordingScreen(),
    );
  }
}
