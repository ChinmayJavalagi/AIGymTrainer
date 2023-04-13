import 'package:ai_gym_trainer/onbording_screen1.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'activity_screen_1.dart';
import 'onboarding_screen.dart';

List<CameraDescription>? cameras;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tensorflow Lite',
      home: OnboardingScreen(),
    );
  }
}
