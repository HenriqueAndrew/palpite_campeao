import 'package:json_annotation/json_annotation.dart';
import 'Time.dart';

part 'Partida.g.dart';

@JsonSerializable()
class Partida {
  const Partida({
    required this.partida_id,
    required this.time_mandante,
    required this.time_visitante,
    required this.placar_mandante,
    required this.placar_visitante,
    required this.data_realizacao,
    required this.hora_realizacao
  });

  factory Partida.fromJson(Map<String, dynamic> json) => _$PartidaFromJson(json);

  final int? partida_id;
  final Time time_mandante; //objeto
  final Time time_visitante; //objeto
  final int? placar_mandante;
  final int? placar_visitante;
  final String data_realizacao;
  final String hora_realizacao;

  Map<String, dynamic> toJson() => _$PartidaToJson(this);
}