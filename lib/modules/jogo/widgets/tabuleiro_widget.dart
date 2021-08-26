import 'package:flutter/material.dart';
import 'package:jogo_cobras_escadas/shared/core/app_images.dart';
import 'package:jogo_cobras_escadas/shared/enum_posicao.dart';
import 'package:jogo_cobras_escadas/shared/models/jogadores_model.dart';

class TabuleiroWidget extends StatefulWidget {
  final JogadoresModel jogadoresModel;

  const TabuleiroWidget({
    Key? key,
    required this.jogadoresModel,
  }) : super(key: key);

  @override
  _TabuleiroWidgetState createState() => _TabuleiroWidgetState();
}

class _TabuleiroWidgetState extends State<TabuleiroWidget> {
  @override
  Widget build(BuildContext context) {
    final teste = ((MediaQuery.of(context).size.width / 2) / 10);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: teste * 10,
      color: Colors.green[200],
      child: buildTabuleiro(context, widget.jogadoresModel),
    );
  }
}

Widget buildTabuleiro(BuildContext context, JogadoresModel jogadoresModel) {
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
              bottom: EnumPosicao()
                  .getPositionBotton(jogadoresModel.posicaoJogador1!),
              left: EnumPosicao()
                  .getPositionLeft(jogadoresModel.posicaoJogador1!),
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
              bottom: EnumPosicao()
                  .getPositionBotton(jogadoresModel.posicaoJogador2!),
              left: EnumPosicao()
                  .getPositionLeft(jogadoresModel.posicaoJogador2!),
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
