import 'package:flutter/material.dart';
import 'package:jogo_cobras_escadas/shared/core/app_colors.dart';
import 'package:jogo_cobras_escadas/shared/core/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then(
      (_) => Navigator.pushReplacementNamed(context, '/home'),
    );
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.logo,
              width: 300,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
