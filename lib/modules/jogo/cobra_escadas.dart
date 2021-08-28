import 'package:flutter/cupertino.dart';
import 'package:jogo_cobras_escadas/modules/jogo/jogo_controller.dart';
import 'package:jogo_cobras_escadas/shared/models/posicoes_model.dart';
import 'package:jogo_cobras_escadas/shared/widgets/mensagem_widget.dart';

class CobrasEscadas {
  String jogar(
      int dado1, int dado2, int posicaoAtual, JogoController controller) {
    if (controller.jogoAcabou) {
      return "O jogo acabou!";
    } else if (posicaoAtual + dado1 + dado2 == 100) {
      return "Jogador " +
          (controller.jogadoresModel.jogadorRodada!
              ? controller.jogadoresModel.nomeJogador1!
              : controller.jogadoresModel.nomeJogador2!) +
          " Venceu!";
    }
    return "Jogador " +
        (controller.jogadoresModel.jogadorRodada!
            ? controller.jogadoresModel.nomeJogador1!
            : controller.jogadoresModel.nomeJogador2!) +
        "esta na casa " +
        posicaoAtual.toString();
  }

  bool validar(
      BuildContext context, int dado1, int dado2, JogoController controller) {
    if (controller.jogoAcabou) {
      return false;
    }
    if (controller.jogadoresModel.jogadorRodada!) {
      if (controller.jogadoresModel.posicaoJogador1! + dado1 + dado2 <= 100) {
        controller.jogadoresModel.proximaPosicaoJogador1 =
            controller.jogadoresModel.posicaoJogador1! + dado1 + dado2;
      } else {
        controller.jogadoresModel.proximaPosicaoJogador1 =
            _calcularProximaPosicao(
                dado1, dado2, controller.jogadoresModel.posicaoJogador1!);
      }
    } else {
      if (controller.jogadoresModel.posicaoJogador2! + dado1 + dado2 <= 100) {
        controller.jogadoresModel.proximaPosicaoJogador2 =
            controller.jogadoresModel.posicaoJogador2! + dado1 + dado2;
      } else {
        controller.jogadoresModel.proximaPosicaoJogador2 =
            _calcularProximaPosicao(
                dado1, dado2, controller.jogadoresModel.posicaoJogador2!);
      }
    }
    return true;
  }

  Future<void> movimentarJogador1(
      BuildContext context, JogoController controller) async {
    PosicoesModel posicoesModel = controller.posicoes!.firstWhere((element) =>
        element.valor == (controller.jogadoresModel.proximaPosicaoJogador1));

    if (posicoesModel.atalho.isNotEmpty) {
      if (posicoesModel.atalho == "escada") {
        await MensagemWidget().mostrarMensagem(
            context: context,
            titulo: controller.jogadoresModel.nomeJogador1!,
            conteudo:
                'Você pegou um atalho :) \nvoce vai avançar para a posição ' +
                    posicoesModel.proximaPosicao.toString());
      }
      if (posicoesModel.atalho == "cobra") {
        await MensagemWidget().mostrarMensagem(
            context: context,
            titulo: controller.jogadoresModel.nomeJogador1!,
            conteudo:
                'A cobra pegou você :( \nvoce vai retornar para a posição ' +
                    posicoesModel.proximaPosicao.toString());
      }
      controller.jogadoresModel.proximaPosicaoJogador1 =
          posicoesModel.proximaPosicao;
    }

    if (controller.jogadoresModel.proximaPosicaoJogador1! >
        controller.jogadoresModel.posicaoJogador1!) {
      while (
          controller.jogadoresModel.posicaoJogador1! != posicoesModel.valor) {
        controller.jogadoresModel.posicaoJogador1 =
            controller.jogadoresModel.posicaoJogador1! + 1;
        controller.setposicaoJogador1Notifier =
            controller.jogadoresModel.posicaoJogador1! + 1;
      }
    } else {
      while (controller.jogadoresModel.posicaoJogador1! !=
          posicoesModel.proximaPosicao) {
        controller.jogadoresModel.posicaoJogador1 =
            controller.jogadoresModel.posicaoJogador1! - 1;
        controller.setposicaoJogador1Notifier =
            controller.jogadoresModel.posicaoJogador1! - 1;
      }
    }

    controller.jogadoresModel.posicaoJogador1 =
        controller.jogadoresModel.proximaPosicaoJogador1;

    if (controller.jogadoresModel.posicaoJogador1 == 100) {
      MensagemWidget().mostrarMensagem(
          context: context,
          titulo: controller.jogadoresModel.nomeJogador1!,
          conteudo: 'Parabéns !!!\nvoce ganhou o jogo!');
      controller.setJogoAcabou = true;
    }
  }

  Future<void> movimentarJogador2(
      BuildContext context, JogoController controller) async {
    PosicoesModel posicoesModel = controller.posicoes!.firstWhere((element) =>
        element.valor == (controller.jogadoresModel.proximaPosicaoJogador2));

    if (posicoesModel.atalho.isNotEmpty) {
      if (posicoesModel.atalho == "escada") {
        await MensagemWidget().mostrarMensagem(
            context: context,
            titulo: controller.jogadoresModel.nomeJogador2!,
            conteudo:
                'Você pegou um atalho :) \nvoce vai avançar para a posição ' +
                    posicoesModel.proximaPosicao.toString());
      }
      if (posicoesModel.atalho == "cobra") {
        await MensagemWidget().mostrarMensagem(
            context: context,
            titulo: controller.jogadoresModel.nomeJogador2!,
            conteudo:
                'A cobra pegou você :( \nvoce vai retornar para a posição ' +
                    posicoesModel.proximaPosicao.toString());
      }
      controller.jogadoresModel.proximaPosicaoJogador2 =
          posicoesModel.proximaPosicao;
    }

    if (controller.jogadoresModel.proximaPosicaoJogador2! >
        controller.jogadoresModel.posicaoJogador2!) {
      while (
          controller.jogadoresModel.posicaoJogador2! != posicoesModel.valor) {
        controller.jogadoresModel.posicaoJogador2 =
            controller.jogadoresModel.posicaoJogador2! + 1;
        controller.setposicaoJogador2Notifier =
            controller.jogadoresModel.posicaoJogador2! + 1;
      }
    } else {
      while (controller.jogadoresModel.posicaoJogador2! !=
          posicoesModel.proximaPosicao) {
        controller.jogadoresModel.posicaoJogador2 =
            controller.jogadoresModel.posicaoJogador2! - 1;
        controller.setposicaoJogador2Notifier =
            controller.jogadoresModel.posicaoJogador2! - 1;
      }
    }

    controller.jogadoresModel.posicaoJogador2 =
        controller.jogadoresModel.proximaPosicaoJogador2;

    if (controller.jogadoresModel.posicaoJogador2 == 100) {
      MensagemWidget().mostrarMensagem(
          context: context,
          titulo: controller.jogadoresModel.nomeJogador2!,
          conteudo: 'Parabéns !!!\nvoce ganhou o jogo!');
      controller.setJogoAcabou = true;
    }
  }

  int _calcularProximaPosicao(int dado1, int dado2, int posicaoAtual) {
    return (100 - ((dado1 + dado2) - (100 - posicaoAtual)));
  }
}
