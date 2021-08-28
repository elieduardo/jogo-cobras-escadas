import 'package:flutter/material.dart';
import 'package:jogo_cobras_escadas/modules/jogo/jogo_controller.dart';
import 'package:jogo_cobras_escadas/shared/core/app_colors.dart';
import 'package:jogo_cobras_escadas/shared/core/app_images.dart';
import 'package:jogo_cobras_escadas/shared/models/jogadores_model.dart';

class TabuleiroWidget extends StatefulWidget {
  final JogoController controller;

  const TabuleiroWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _TabuleiroWidgetState createState() => _TabuleiroWidgetState();
}

class _TabuleiroWidgetState extends State<TabuleiroWidget> {
  @override
  void initState() {
    widget.controller.posicaoJogador1Notifier.addListener(() {
      setState(() {});
    });
    widget.controller.posicaoJogador2Notifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final teste = ((MediaQuery.of(context).size.width / 2) / 10);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: teste * 10,
      color: Colors.green[100],
      child: buildTabuleiro(
          context, widget.controller.jogadoresModel, widget.controller),
    );
  }
}

Widget buildTabuleiro(BuildContext context, JogadoresModel jogadoresModel,
    JogoController controller) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        children: [
          Image.asset(
            AppImages.tabuleiro,
          ),
          if (jogadoresModel.posicaoJogador1 != 0)
            Positioned(
              bottom: controller.posicoes!
                  .firstWhere((element) =>
                      element.valor == jogadoresModel.posicaoJogador1)
                  .bottom,
              left: controller.posicoes!
                  .firstWhere((element) =>
                      element.valor == jogadoresModel.posicaoJogador1)
                  .left,
              child: Container(
                width: 52,
                height: 52,
                child: Image.asset(
                  AppImages.boneco1,
                ),
              ),
            ),
          if (jogadoresModel.posicaoJogador2 != 0)
            Positioned(
              bottom: controller.posicoes!
                  .firstWhere((element) =>
                      element.valor == jogadoresModel.posicaoJogador2)
                  .bottom,
              left: controller.posicoes!
                  .firstWhere((element) =>
                      element.valor == jogadoresModel.posicaoJogador2)
                  .left,
              child: Container(
                width: 52,
                height: 52,
                child: Image.asset(
                  AppImages.boneco2,
                ),
              ),
            ),
        ],
      ),
      if (jogadoresModel.posicaoJogador2 == 0 ||
          jogadoresModel.posicaoJogador1 == 0)
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              SizedBox(
                width: 70,
              ),
              if (jogadoresModel.posicaoJogador1 == 0)
                Container(
                  width: 52,
                  height: 52,
                  child: Column(
                    children: [
                      Image.asset(
                        AppImages.boneco1,
                      ),
                    ],
                  ),
                ),
              if (jogadoresModel.posicaoJogador2 == 0)
                Container(
                  width: 52,
                  height: 52,
                  child: Image.asset(
                    AppImages.boneco2,
                  ),
                )
            ],
          ),
        ),
    ],
  );
}
