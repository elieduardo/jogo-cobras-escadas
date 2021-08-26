import 'package:flutter/material.dart';

import 'package:jogo_cobras_escadas/shared/models/jogadores_model.dart';

import 'widgets/jogo_widget.dart';
import 'widgets/tabuleiro_widget.dart';

class JogoPage extends StatefulWidget {
  final JogadoresModel jogadoresModel;

  const JogoPage({
    Key? key,
    required this.jogadoresModel,
  }) : super(key: key);

  @override
  _JogoPageState createState() => _JogoPageState();
}

class _JogoPageState extends State<JogoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          TabuleiroWidget(
            jogadoresModel: widget.jogadoresModel,
          ),
          JogoWidget(
            jogadoresModel: widget.jogadoresModel,
          ),
        ],
      ),
    );
  }
}
