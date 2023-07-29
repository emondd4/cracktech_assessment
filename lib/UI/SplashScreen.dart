import 'dart:async';

import 'package:cracktech_assessment/Utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{

  late Animation animation;
  late Animation colorAnimation;
  late AnimationController animationController;

  double height = 64;
  double width = 64;

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 4));
    animation = Tween(begin:0.0 ,end: 1024.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.black,end: Colors.white).animate(animationController);

    animationController.addListener(() {
      setState(() {
        height = animation.value;
        width = animation.value;
      });
    });

    animationController.forward();

    Timer(const Duration(seconds: 5), () {
      Get.offAllNamed("homePage");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: animation.value,
            width: animation.value,
            decoration: BoxDecoration(
                color: colorAnimation.value,
            ),
            child: Center(
              child: Lottie.asset(AppImages.instance.splashAnin,height: 96.0,width: 96.0)
            ),
          ),
        ),
      ),
    );
  }
}
