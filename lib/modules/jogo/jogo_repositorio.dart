import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:jogo_cobras_escadas/shared/models/posicoes_model.dart';

class JogoRepositorio {
  Future<List<PosicoesModel>> getPosicoes() async {
    final responde = await rootBundle.loadString("database/posicoes.json");
    final list = jsonDecode(responde) as List;
    final posicoes = list.map((e) => PosicoesModel.fromMap(e)).toList();
    return posicoes;
  }
}
