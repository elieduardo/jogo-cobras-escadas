import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:jogo_cobras_escadas/modules/jogo/jogo_controller.dart';
import 'package:jogo_cobras_escadas/modules/jogo/jogo_estado.dart';
import 'package:jogo_cobras_escadas/shared/core/app_colors.dart';
import 'widgets/jogo_widget.dart';
import 'widgets/tabuleiro_widget.dart';

class JogoPage extends StatefulWidget {
  final JogoController controller;

  const JogoPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _JogoPageState createState() => _JogoPageState();
}

class _JogoPageState extends State<JogoPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.jogadoresModel.posicaoJogador1 = 0;
    widget.controller.jogadoresModel.posicaoJogador2 = 0;
    widget.controller.getPosicoes();
    widget.controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.controller.estado == JogoEstado.successo
        ? Scaffold(
            backgroundColor: Colors.green[100],
            body: Row(
              children: [
                AnimatedCard(
                  direction: AnimatedCardDirection.top,
                  child: TabuleiroWidget(
                    controller: widget.controller,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: AnimatedCard(
                      direction: AnimatedCardDirection.top,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: JogoWidget(
                          controller: widget.controller,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
            ),
          );
  }
}
