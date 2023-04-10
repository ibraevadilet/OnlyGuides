import 'package:flutter/material.dart';

import 'package:only_guides/core/app_images.dart';
import 'package:only_guides/feature/auth/on_boarding_screen.dart';
import 'package:only_guides/widgets/buttom_navigator.dart';
import 'package:only_guides/widgets/spaces.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        ),
        (protected) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getWidth(context),
        height: getHeight(context),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(AppImages.spalashImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
