import 'dart:convert';

class PosicoesModel {
  final double bottom;
  final double left;
  final int valor;
  final String atalho;
  final int proximaPosicao;

  PosicoesModel({
    required this.bottom,
    required this.left,
    required this.valor,
    required this.atalho,
    required this.proximaPosicao,
  });

  PosicoesModel copyWith({
    double? bottom,
    double? left,
    int? valor,
    String? atalho,
    int? proximaPosicao,
  }) {
    return PosicoesModel(
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      valor: valor ?? this.valor,
      atalho: atalho ?? this.atalho,
      proximaPosicao: proximaPosicao ?? this.proximaPosicao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bottom': bottom,
      'left': left,
      'valor': valor,
      'atalho': atalho,
      'proximaPosicao': proximaPosicao,
    };
  }

  factory PosicoesModel.fromMap(Map<String, dynamic> map) {
    return PosicoesModel(
      bottom: map['bottom'],
      left: map['left'],
      valor: map['valor'],
      atalho: map['atalho'] != null ? map['atalho'] : "",
      proximaPosicao: map['proximaPosicao'] != null ? map['proximaPosicao'] : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PosicoesModel.fromJson(String source) =>
      PosicoesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PosicoesModel(bottom: $bottom, left: $left, valor: $valor, atalho: $atalho, proximaPosicao: $proximaPosicao)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PosicoesModel &&
        other.bottom == bottom &&
        other.left == left &&
        other.valor == valor &&
        other.atalho == atalho &&
        other.proximaPosicao == proximaPosicao;
  }

  @override
  int get hashCode {
    return bottom.hashCode ^
        left.hashCode ^
        valor.hashCode ^
        atalho.hashCode ^
        proximaPosicao.hashCode;
  }
}
