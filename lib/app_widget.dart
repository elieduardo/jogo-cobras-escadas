import 'package:flutter/material.dart';
import 'package:jogo_cobras_escadas/modules/home/home_page.dart';
import 'package:jogo_cobras_escadas/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jogo Cobras e Escadas",
      home: SplashPage(),
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
