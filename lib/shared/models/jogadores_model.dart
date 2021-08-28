import 'dart:convert';

class JogadoresModel {
  final String? nomeJogador1;
  final String? nomeJogador2;
  late int? posicaoJogador1;
  late int? posicaoJogador2;
  late int? proximaPosicaoJogador1;
  late int? proximaPosicaoJogador2;
  late bool? jogadorRodada;

  JogadoresModel({
    this.nomeJogador1,
    this.nomeJogador2,
    this.posicaoJogador1 = 0,
    this.posicaoJogador2 = 0,
    this.proximaPosicaoJogador1 = 0,
    this.proximaPosicaoJogador2 = 0,
    this.jogadorRodada = true,
  });

  JogadoresModel copyWith({
    String? nomeJogador1,
    String? nomeJogador2,
    int? posicaoJogador1,
    int? posicaoJogador2,
    int? proximaPosicaoJogador1,
    int? proximaPosicaoJogador2,
    bool? jogadorRodada,
  }) {
    return JogadoresModel(
      nomeJogador1: nomeJogador1 ?? this.nomeJogador1,
      nomeJogador2: nomeJogador2 ?? this.nomeJogador2,
      posicaoJogador1: posicaoJogador1 ?? this.posicaoJogador1,
      posicaoJogador2: posicaoJogador2 ?? this.posicaoJogador2,
      proximaPosicaoJogador1:
          proximaPosicaoJogador1 ?? this.proximaPosicaoJogador1,
      proximaPosicaoJogador2:
          proximaPosicaoJogador2 ?? this.proximaPosicaoJogador2,
      jogadorRodada: jogadorRodada ?? this.jogadorRodada,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nomeJogador1': nomeJogador1,
      'nomeJogador2': nomeJogador2,
      'posicaoJogador1': posicaoJogador1,
      'posicaoJogador2': posicaoJogador2,
      'proximaPosicaoJogador1': proximaPosicaoJogador1,
      'proximaPosicaoJogador2': proximaPosicaoJogador2,
      'jogadorRodada': jogadorRodada,
    };
  }

  factory JogadoresModel.fromMap(Map<String, dynamic> map) {
    return JogadoresModel(
      nomeJogador1: map['nomeJogador1'],
      nomeJogador2: map['nomeJogador2'],
      posicaoJogador1: map['posicaoJogador1'],
      posicaoJogador2: map['posicaoJogador2'],
      proximaPosicaoJogador1: map['proximaPosicaoJogador1'],
      proximaPosicaoJogador2: map['proximaPosicaoJogador2'],
      jogadorRodada: map['jogadorRodada'],
    );
  }

  String toJson() => json.encode(toMap());

  factory JogadoresModel.fromJson(String source) =>
      JogadoresModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'JogadoresModel(nomeJogador1: $nomeJogador1, nomeJogador2: $nomeJogador2, posicaoJogador1: $posicaoJogador1, posicaoJogador2: $posicaoJogador2, proximaPosicaoJogador1: $proximaPosicaoJogador1, proximaPosicaoJogador2: $proximaPosicaoJogador2, jogadorRodada: $jogadorRodada)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JogadoresModel &&
        other.nomeJogador1 == nomeJogador1 &&
        other.nomeJogador2 == nomeJogador2 &&
        other.posicaoJogador1 == posicaoJogador1 &&
        other.posicaoJogador2 == posicaoJogador2 &&
        other.proximaPosicaoJogador1 == proximaPosicaoJogador1 &&
        other.proximaPosicaoJogador2 == proximaPosicaoJogador2 &&
        other.jogadorRodada == jogadorRodada;
  }

  @override
  int get hashCode {
    return nomeJogador1.hashCode ^
        nomeJogador2.hashCode ^
        posicaoJogador1.hashCode ^
        posicaoJogador2.hashCode ^
        proximaPosicaoJogador1.hashCode ^
        proximaPosicaoJogador2.hashCode ^
        jogadorRodada.hashCode;
  }
}
