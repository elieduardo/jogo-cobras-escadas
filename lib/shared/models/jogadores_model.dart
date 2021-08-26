class JogadoresModel {
  final String? nomeJogador1;
  final String? nomeJogador2;
  late int? posicaoJogador1;
  late int? posicaoJogador2;
  late bool? jogadorRodada;

  JogadoresModel({
    this.nomeJogador1,
    this.nomeJogador2,
    this.posicaoJogador1 = 0,
    this.posicaoJogador2 = 0,
    this.jogadorRodada = true,
  });

  JogadoresModel copyWith({
    String? nomeJogador1,
    String? nomeJogador2,
    int? posicaoJogador1,
    int? posicaoJogador2,
    bool? jogadorRodada,
  }) {
    return JogadoresModel(
      nomeJogador1: nomeJogador1 ?? this.nomeJogador1,
      nomeJogador2: nomeJogador2 ?? this.nomeJogador2,
      posicaoJogador1: posicaoJogador1 ?? this.posicaoJogador1,
      posicaoJogador2: posicaoJogador2 ?? this.posicaoJogador2,
      jogadorRodada: jogadorRodada ?? this.jogadorRodada,
    );
  }

  @override
  String toString() {
    return 'JogadoresModel(nomeJogador1: $nomeJogador1, nomeJogador2: $nomeJogador2, posicaoJogador1: $posicaoJogador1, posicaoJogador2: $posicaoJogador2, jogadorRodada: $jogadorRodada)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JogadoresModel &&
        other.nomeJogador1 == nomeJogador1 &&
        other.nomeJogador2 == nomeJogador2 &&
        other.posicaoJogador1 == posicaoJogador1 &&
        other.posicaoJogador2 == posicaoJogador2 &&
        other.jogadorRodada == jogadorRodada;
  }

  @override
  int get hashCode {
    return nomeJogador1.hashCode ^
        nomeJogador2.hashCode ^
        posicaoJogador1.hashCode ^
        posicaoJogador2.hashCode ^
        jogadorRodada.hashCode;
  }
}
