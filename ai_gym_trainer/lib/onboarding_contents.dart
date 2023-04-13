import 'package:flutter/material.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    // title: "Track Your work and get the result",
    title: "Good Healthy!",
    image: "assets/images/image1.png",
    desc: "Remember to keep track of your health, be aware of all the changes.",
  ),
  OnboardingContents(
    title: "Workout Anywhere",
    image: "assets/images/image2.png",
    desc:
        "You can do your workout at home without any equipment, outside or at the gym.",
  ),
  OnboardingContents(
    title: "Get Personalised AI Reports!",
    image: "assets/images/image3.png",
    desc:
        "Take control of mail notifications, or get report within the app.",
  ),
];
