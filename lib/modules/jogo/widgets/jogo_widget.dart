import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jogo_cobras_escadas/shared/core/app_images.dart';
import 'package:jogo_cobras_escadas/shared/models/jogadores_model.dart';
import 'package:jogo_cobras_escadas/shared/widgets/button_widget.dart';

class JogoWidget extends StatefulWidget {
  final JogadoresModel jogadoresModel;

  const JogoWidget({
    Key? key,
    required this.jogadoresModel,
  }) : super(key: key);

  @override
  _JogoWidgetState createState() => _JogoWidgetState();
}

class _JogoWidgetState extends State<JogoWidget> {
  int _valorDado1 = 0;
  int _valorDado2 = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 2,
      color: Colors.green[500],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(widget.jogadoresModel.jogadorRodada!
                    ? AppImages.boneco1
                    : AppImages.boneco2),
                SizedBox(
                  width: 10,
                ),
                Text(
                  (widget.jogadoresModel.jogadorRodada!
                          ? widget.jogadoresModel.nomeJogador1!
                          : widget.jogadoresModel.nomeJogador2!) +
                      ' é a sua vez de jogar',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
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
          ButtonWidget(
            label: "Sortear numeros",
            backgroudColor: Colors.white,
            fontColor: Colors.black,
            onPressed: () => {
              sortearDados(),
            },
          ),
        ],
      ),
    );
  }

  void sortearDados() {
    Random random = new Random();
    setState(() {
      _valorDado1 = random.nextInt(7);
      _valorDado2 = random.nextInt(7);
      if (_valorDado1 != _valorDado2)
        widget.jogadoresModel.jogadorRodada =
            !widget.jogadoresModel.jogadorRodada!;
    });
  }
}
