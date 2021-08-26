import 'package:flutter/material.dart';
import 'package:jogo_cobras_escadas/modules/jogo/jogo_page.dart';
import 'package:jogo_cobras_escadas/shared/core/app_images.dart';
import 'package:jogo_cobras_escadas/shared/models/jogadores_model.dart';
import 'package:jogo_cobras_escadas/shared/validacoes.dart';
import 'package:jogo_cobras_escadas/shared/widgets/button_widget.dart';
import 'package:jogo_cobras_escadas/shared/widgets/input_text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formValidator = Validacoes();
    final nomeJogador1 = TextEditingController();
    final nomeJogador2 = TextEditingController();
    JogadoresModel jogadoresModel = JogadoresModel();

    void onChange({String? nomeJogador1, String? nomeJogador2}) {
      jogadoresModel = jogadoresModel.copyWith(
        nomeJogador1: nomeJogador1,
        nomeJogador2: nomeJogador2,
      );
    }

    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Image.asset(
                AppImages.logo,
                width: 300,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            width: 500,
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Começe a jogar!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Form(
                  key: formValidator.formKey,
                  child: Column(
                    children: [
                      InputTextWidget(
                        label: "Nome do 1º jogador",
                        controller: nomeJogador1,
                        validator: formValidator.validarNome,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) => {
                          onChange(
                            nomeJogador1: value,
                          ),
                        },
                      ),
                      InputTextWidget(
                        label: "Nome do 2º jogador",
                        validator: formValidator.validarNome,
                        controller: nomeJogador2,
                        onChanged: (value) => {
                          onChange(
                            nomeJogador2: value,
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                ButtonWidget(
                  label: "Jogar",
                  backgroudColor: Colors.green,
                  fontColor: Colors.white,
                  onPressed: () => {
                    formValidator.formKey.currentState!.validate()
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JogoPage(
                                jogadoresModel: jogadoresModel,
                              ),
                            ),
                          )
                        : null
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}