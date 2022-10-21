import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ds_bfi/flutter_ds_bfi.dart';
import 'package:flutter_newspaper_app/core/utils/route_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/strings_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isSplashScreenVisible = false;

  @override
  void initState() {
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        _isSplashScreenVisible = true;
      });
    });
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        RouteUtil.loginRoute,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedOpacity(
          opacity: _isSplashScreenVisible ? 1 : 0,
          duration: const Duration(milliseconds: 1500),
          child: RPadding(
            padding: REdgeInsets.only(bottom: 80),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Strings.appLogoPath,
                    key: ValueKey('imageSplashScreen'),
                    width: 160.w,
                    height: 160.w,
                  ),
                  DSText(
                    data: Strings.appTitle,
                    textStyle: DSTextStyle.titleTextStyle,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
