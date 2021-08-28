import 'package:flutter/cupertino.dart';
import 'package:jogo_cobras_escadas/modules/jogo/jogo_estado.dart';
import 'package:jogo_cobras_escadas/modules/jogo/jogo_repositorio.dart';
import 'package:jogo_cobras_escadas/shared/models/jogadores_model.dart';
import 'package:jogo_cobras_escadas/shared/models/posicoes_model.dart';

class JogoController {
  final stateNotifier = ValueNotifier<JogoEstado>(JogoEstado.vazio);
  set estado(JogoEstado estado) => stateNotifier.value = estado;
  JogoEstado get estado => stateNotifier.value;

  JogadoresModel jogadoresModel = JogadoresModel();

  bool jogoAcabou = false;

  set setJogoAcabou(bool value) => jogoAcabou = value;

  final posicaoJogador1Notifier = ValueNotifier<int>(0);
  set setposicaoJogador1Notifier(int value) =>
      posicaoJogador1Notifier.value = value;

  final posicaoJogador2Notifier = ValueNotifier<int>(0);
  set setposicaoJogador2Notifier(int value) =>
      posicaoJogador2Notifier.value = value;

  List<PosicoesModel>? posicoes;

  final repositorio = JogoRepositorio();

  void getPosicoes() async {
    estado = JogoEstado.carregando;
    posicoes = await repositorio.getPosicoes();
    estado = JogoEstado.successo;
  }
}
