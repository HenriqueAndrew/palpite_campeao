import 'package:json_annotation/json_annotation.dart';

part 'Time.g.dart';

@JsonSerializable()
class Time {
  const Time({
    required this.time_id,
    required this.nome_popular,
    required this.sigla,
    required this.escudo,
  });

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  final int time_id;
  final String nome_popular;
  final String sigla;
  final String escudo;

  Map<String, dynamic> toJson() => _$TimeToJson(this);
}