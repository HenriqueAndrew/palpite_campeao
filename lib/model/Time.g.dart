// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Time _$TimeFromJson(Map<String, dynamic> json) => Time(
      time_id: (json['time_id'] as num).toInt(),
      nome_popular: json['nome_popular'] as String,
      sigla: json['sigla'] as String,
      escudo: json['escudo'] as String,
    );

Map<String, dynamic> _$TimeToJson(Time instance) => <String, dynamic>{
      'time_id': instance.time_id,
      'nome_popular': instance.nome_popular,
      'sigla': instance.sigla,
      'escudo': instance.escudo,
    };
