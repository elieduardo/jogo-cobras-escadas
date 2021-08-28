import 'package:flutter/material.dart';

class MensagemWidget {
  Future<void> mostrarMensagem(
      {required BuildContext context,
      required String titulo,
      required String conteudo,
      final VoidCallback? onClick}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Center(child: Text(titulo)),
        content: Text(
          conteudo,
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: TextButton(
                child: Text("Entendi"),
                onPressed: onClick != null
                    ? onClick
                    : () {
                        Navigator.pop(context);
                      }),
          ),
        ],
      ),
    );
  }
}
