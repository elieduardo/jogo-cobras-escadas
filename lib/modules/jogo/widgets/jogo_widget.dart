import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jogo_cobras_escadas/modules/home/home_page.dart';
import 'package:jogo_cobras_escadas/modules/jogo/cobra_escadas.dart';
import 'package:jogo_cobras_escadas/modules/jogo/jogo_controller.dart';
import 'package:jogo_cobras_escadas/shared/core/app_colors.dart';
import 'package:jogo_cobras_escadas/shared/core/app_images.dart';
import 'package:jogo_cobras_escadas/shared/widgets/button_widget.dart';
import 'package:jogo_cobras_escadas/shared/widgets/mensagem_widget.dart';

class JogoWidget extends StatefulWidget {
  final JogoController controller;

  const JogoWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _JogoWidgetState createState() => _JogoWidgetState();
}

class _JogoWidgetState extends State<JogoWidget> {
  int _valorDado1 = 0;
  int _valorDado2 = 0;
  bool _botaoSortear = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(widget.controller.jogadoresModel.jogadorRodada!
                    ? AppImages.boneco1
                    : AppImages.boneco2),
                SizedBox(
                  width: 10,
                ),
                Text(
                  (widget.controller.jogadoresModel.jogadorRodada!
                          ? widget.controller.jogadoresModel.nomeJogador1!
                          : widget.controller.jogadoresModel.nomeJogador2!) +
                      ' é a sua vez de jogar',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 100,
                height: 100,
                child: Center(
                  child: Text(
                    _valorDado1.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Text(
                '+',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 100,
                height: 100,
                child: Center(
                  child: Text(
                    _valorDado2.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Text(
                '=',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                (_valorDado1 + _valorDado2).toString(),
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          _botaoSortear
              ? ButtonWidget(
                  label: "Sortear numeros",
                  backgroudColor: Colors.green,
                  fontColor: Colors.black,
                  onPressed: () => {
                    sortearDados(),
                  },
                )
              : ButtonWidget(
                  label: "Movimentar jogador",
                  backgroudColor: Colors.green,
                  fontColor: Colors.black,
                  onPressed: () => {
                    movimentarJogador(),
                    setState(() {
                      _valorDado1 = 0;
                      _valorDado2 = 0;
                    })
                  },
                )
        ],
      ),
    );
  }

  Future<void> movimentarJogador() async {
    if (widget.controller.jogadoresModel.jogadorRodada!) {
      CobrasEscadas().movimentarJogador1(context, widget.controller);
    } else {
      CobrasEscadas().movimentarJogador2(context, widget.controller);
    }
    if (_valorDado1 != _valorDado2) {
      widget.controller.jogadoresModel.jogadorRodada =
          !widget.controller.jogadoresModel.jogadorRodada!;
    } else if (!widget.controller.jogoAcabou) {
      MensagemWidget().mostrarMensagem(
          context: context,
          titulo: widget.controller.jogadoresModel.jogadorRodada!
              ? widget.controller.jogadoresModel.nomeJogador1!
              : widget.controller.jogadoresModel.nomeJogador2!,
          conteudo: 'Você ganhou mais uma jogada!');
    }

    setState(() {
      _botaoSortear = !_botaoSortear;
    });
  }

  Future<void> sortearDados() async {
    if (widget.controller.jogoAcabou) {
      return await MensagemWidget().mostrarMensagem(
          context: context,
          titulo: "Atenção",
          conteudo: 'o jogo acabou :(',
          onClick: () {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          });
    }
    Random random = new Random();

    int _valorDadoSorteio1 = random.nextInt(6) + 1;
    int _valorDadoSorteio2 = random.nextInt(6) + 1;

    if (CobrasEscadas().validar(
        context, _valorDadoSorteio1, _valorDadoSorteio2, widget.controller)) {
      setState(() {
        _valorDado1 = _valorDadoSorteio1;
        _valorDado2 = _valorDadoSorteio2;
        _botaoSortear = !_botaoSortear;
      });
    }
  }
}
