// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Partida.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Partida _$PartidaFromJson(Map<String, dynamic> json) => Partida(
      partida_id: (json['partida_id'] as num?)?.toInt(),
      time_mandante:
          Time.fromJson(json['time_mandante'] as Map<String, dynamic>),
      time_visitante:
          Time.fromJson(json['time_visitante'] as Map<String, dynamic>),
      placar_mandante: (json['placar_mandante'] as num?)?.toInt(),
      placar_visitante: (json['placar_visitante'] as num?)?.toInt(),
      data_realizacao: json['data_realizacao'] as String,
      hora_realizacao: json['hora_realizacao'] as String,
    );

Map<String, dynamic> _$PartidaToJson(Partida instance) => <String, dynamic>{
      'partida_id': instance.partida_id,
      'time_mandante': instance.time_mandante,
      'time_visitante': instance.time_visitante,
      'placar_mandante': instance.placar_mandante,
      'placar_visitante': instance.placar_visitante,
      'data_realizacao': instance.data_realizacao,
      'hora_realizacao': instance.hora_realizacao,
    };
