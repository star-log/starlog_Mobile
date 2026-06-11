import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:starlog_mobile/core/constants/app_assets.dart';
import 'package:starlog_mobile/core/constants/text_style.dart';

class StarlogSplash extends StatefulWidget {
  const StarlogSplash({super.key});

  @override
  State<StarlogSplash> createState() => _StarlogSplashState();
}

class _StarlogSplashState extends State<StarlogSplash> {
  bool _isSplashVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        _isSplashVisible = true;
      });
      await Future.delayed(Duration(seconds: 3));
      context.go('/');
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: _isSplashVisible ? 1 : 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.1),
                        BlendMode.srcATop,
                      ),
                      child: SvgPicture.asset(AppAssets.splashStar),
                    ),
                  ),
                  SvgPicture.asset(AppAssets.splashStar),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('별그늘', style: StarlogTextStyle.splash),
              )
            ],
          )
        ),
      ),
    );
  }
}
