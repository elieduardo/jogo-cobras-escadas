import 'package:flutter/material.dart';

class Validacoes {
  final formKey = GlobalKey<FormState>();

  String? validarNome(String? value) {
    if (value!.isEmpty) {
      return "O nome do jogador deve ser informado";
    }
    if (value.trim().isEmpty) {
      return "O nome do jogador deve ser informado";
    }
    return null;
  }
}
