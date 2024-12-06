// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Database.dart';

// ignore_for_file: type=lint
class $TimesTable extends Times with TableInfo<$TimesTable, Time> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _time_idMeta =
      const VerificationMeta('time_id');
  @override
  late final GeneratedColumn<int> time_id = GeneratedColumn<int>(
      'time_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nome_popularMeta =
      const VerificationMeta('nome_popular');
  @override
  late final GeneratedColumn<String> nome_popular = GeneratedColumn<String>(
      'nome_popular', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _siglaMeta = const VerificationMeta('sigla');
  @override
  late final GeneratedColumn<String> sigla = GeneratedColumn<String>(
      'sigla', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _escudoMeta = const VerificationMeta('escudo');
  @override
  late final GeneratedColumn<String> escudo = GeneratedColumn<String>(
      'escudo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [time_id, nome_popular, sigla, escudo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'times';
  @override
  VerificationContext validateIntegrity(Insertable<Time> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('time_id')) {
      context.handle(_time_idMeta,
          time_id.isAcceptableOrUnknown(data['time_id']!, _time_idMeta));
    }
    if (data.containsKey('nome_popular')) {
      context.handle(
          _nome_popularMeta,
          nome_popular.isAcceptableOrUnknown(
              data['nome_popular']!, _nome_popularMeta));
    } else if (isInserting) {
      context.missing(_nome_popularMeta);
    }
    if (data.containsKey('sigla')) {
      context.handle(
          _siglaMeta, sigla.isAcceptableOrUnknown(data['sigla']!, _siglaMeta));
    } else if (isInserting) {
      context.missing(_siglaMeta);
    }
    if (data.containsKey('escudo')) {
      context.handle(_escudoMeta,
          escudo.isAcceptableOrUnknown(data['escudo']!, _escudoMeta));
    } else if (isInserting) {
      context.missing(_escudoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {time_id};
  @override
  Time map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Time(
      time_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_id'])!,
      nome_popular: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome_popular'])!,
      sigla: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sigla'])!,
      escudo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}escudo'])!,
    );
  }

  @override
  $TimesTable createAlias(String alias) {
    return $TimesTable(attachedDatabase, alias);
  }
}

class Time extends DataClass implements Insertable<Time> {
  final int time_id;
  final String nome_popular;
  final String sigla;
  final String escudo;
  const Time(
      {required this.time_id,
      required this.nome_popular,
      required this.sigla,
      required this.escudo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['time_id'] = Variable<int>(time_id);
    map['nome_popular'] = Variable<String>(nome_popular);
    map['sigla'] = Variable<String>(sigla);
    map['escudo'] = Variable<String>(escudo);
    return map;
  }

  TimesCompanion toCompanion(bool nullToAbsent) {
    return TimesCompanion(
      time_id: Value(time_id),
      nome_popular: Value(nome_popular),
      sigla: Value(sigla),
      escudo: Value(escudo),
    );
  }

  factory Time.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Time(
      time_id: serializer.fromJson<int>(json['time_id']),
      nome_popular: serializer.fromJson<String>(json['nome_popular']),
      sigla: serializer.fromJson<String>(json['sigla']),
      escudo: serializer.fromJson<String>(json['escudo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'time_id': serializer.toJson<int>(time_id),
      'nome_popular': serializer.toJson<String>(nome_popular),
      'sigla': serializer.toJson<String>(sigla),
      'escudo': serializer.toJson<String>(escudo),
    };
  }

  Time copyWith(
          {int? time_id,
          String? nome_popular,
          String? sigla,
          String? escudo}) =>
      Time(
        time_id: time_id ?? this.time_id,
        nome_popular: nome_popular ?? this.nome_popular,
        sigla: sigla ?? this.sigla,
        escudo: escudo ?? this.escudo,
      );
  Time copyWithCompanion(TimesCompanion data) {
    return Time(
      time_id: data.time_id.present ? data.time_id.value : this.time_id,
      nome_popular: data.nome_popular.present
          ? data.nome_popular.value
          : this.nome_popular,
      sigla: data.sigla.present ? data.sigla.value : this.sigla,
      escudo: data.escudo.present ? data.escudo.value : this.escudo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Time(')
          ..write('time_id: $time_id, ')
          ..write('nome_popular: $nome_popular, ')
          ..write('sigla: $sigla, ')
          ..write('escudo: $escudo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(time_id, nome_popular, sigla, escudo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Time &&
          other.time_id == this.time_id &&
          other.nome_popular == this.nome_popular &&
          other.sigla == this.sigla &&
          other.escudo == this.escudo);
}

class TimesCompanion extends UpdateCompanion<Time> {
  final Value<int> time_id;
  final Value<String> nome_popular;
  final Value<String> sigla;
  final Value<String> escudo;
  const TimesCompanion({
    this.time_id = const Value.absent(),
    this.nome_popular = const Value.absent(),
    this.sigla = const Value.absent(),
    this.escudo = const Value.absent(),
  });
  TimesCompanion.insert({
    this.time_id = const Value.absent(),
    required String nome_popular,
    required String sigla,
    required String escudo,
  })  : nome_popular = Value(nome_popular),
        sigla = Value(sigla),
        escudo = Value(escudo);
  static Insertable<Time> custom({
    Expression<int>? time_id,
    Expression<String>? nome_popular,
    Expression<String>? sigla,
    Expression<String>? escudo,
  }) {
    return RawValuesInsertable({
      if (time_id != null) 'time_id': time_id,
      if (nome_popular != null) 'nome_popular': nome_popular,
      if (sigla != null) 'sigla': sigla,
      if (escudo != null) 'escudo': escudo,
    });
  }

  TimesCompanion copyWith(
      {Value<int>? time_id,
      Value<String>? nome_popular,
      Value<String>? sigla,
      Value<String>? escudo}) {
    return TimesCompanion(
      time_id: time_id ?? this.time_id,
      nome_popular: nome_popular ?? this.nome_popular,
      sigla: sigla ?? this.sigla,
      escudo: escudo ?? this.escudo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (time_id.present) {
      map['time_id'] = Variable<int>(time_id.value);
    }
    if (nome_popular.present) {
      map['nome_popular'] = Variable<String>(nome_popular.value);
    }
    if (sigla.present) {
      map['sigla'] = Variable<String>(sigla.value);
    }
    if (escudo.present) {
      map['escudo'] = Variable<String>(escudo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimesCompanion(')
          ..write('time_id: $time_id, ')
          ..write('nome_popular: $nome_popular, ')
          ..write('sigla: $sigla, ')
          ..write('escudo: $escudo')
          ..write(')'))
        .toString();
  }
}

class $PartidasTable extends Partidas with TableInfo<$PartidasTable, Partida> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartidasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _partida_idMeta =
      const VerificationMeta('partida_id');
  @override
  late final GeneratedColumn<int> partida_id = GeneratedColumn<int>(
      'partida_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _time_mandanteMeta =
      const VerificationMeta('time_mandante');
  @override
  late final GeneratedColumn<int> time_mandante = GeneratedColumn<int>(
      'time_mandante', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES times (time_id)'));
  static const VerificationMeta _time_visitanteMeta =
      const VerificationMeta('time_visitante');
  @override
  late final GeneratedColumn<int> time_visitante = GeneratedColumn<int>(
      'time_visitante', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES times (time_id)'));
  static const VerificationMeta _placar_mandanteMeta =
      const VerificationMeta('placar_mandante');
  @override
  late final GeneratedColumn<int> placar_mandante = GeneratedColumn<int>(
      'placar_mandante', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _placar_visitanteMeta =
      const VerificationMeta('placar_visitante');
  @override
  late final GeneratedColumn<int> placar_visitante = GeneratedColumn<int>(
      'placar_visitante', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _data_realizacaoMeta =
      const VerificationMeta('data_realizacao');
  @override
  late final GeneratedColumn<String> data_realizacao = GeneratedColumn<String>(
      'data_realizacao', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hora_realizacaoMeta =
      const VerificationMeta('hora_realizacao');
  @override
  late final GeneratedColumn<String> hora_realizacao = GeneratedColumn<String>(
      'hora_realizacao', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        partida_id,
        time_mandante,
        time_visitante,
        placar_mandante,
        placar_visitante,
        data_realizacao,
        hora_realizacao
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partidas';
  @override
  VerificationContext validateIntegrity(Insertable<Partida> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('partida_id')) {
      context.handle(
          _partida_idMeta,
          partida_id.isAcceptableOrUnknown(
              data['partida_id']!, _partida_idMeta));
    }
    if (data.containsKey('time_mandante')) {
      context.handle(
          _time_mandanteMeta,
          time_mandante.isAcceptableOrUnknown(
              data['time_mandante']!, _time_mandanteMeta));
    } else if (isInserting) {
      context.missing(_time_mandanteMeta);
    }
    if (data.containsKey('time_visitante')) {
      context.handle(
          _time_visitanteMeta,
          time_visitante.isAcceptableOrUnknown(
              data['time_visitante']!, _time_visitanteMeta));
    } else if (isInserting) {
      context.missing(_time_visitanteMeta);
    }
    if (data.containsKey('placar_mandante')) {
      context.handle(
          _placar_mandanteMeta,
          placar_mandante.isAcceptableOrUnknown(
              data['placar_mandante']!, _placar_mandanteMeta));
    } else if (isInserting) {
      context.missing(_placar_mandanteMeta);
    }
    if (data.containsKey('placar_visitante')) {
      context.handle(
          _placar_visitanteMeta,
          placar_visitante.isAcceptableOrUnknown(
              data['placar_visitante']!, _placar_visitanteMeta));
    } else if (isInserting) {
      context.missing(_placar_visitanteMeta);
    }
    if (data.containsKey('data_realizacao')) {
      context.handle(
          _data_realizacaoMeta,
          data_realizacao.isAcceptableOrUnknown(
              data['data_realizacao']!, _data_realizacaoMeta));
    } else if (isInserting) {
      context.missing(_data_realizacaoMeta);
    }
    if (data.containsKey('hora_realizacao')) {
      context.handle(
          _hora_realizacaoMeta,
          hora_realizacao.isAcceptableOrUnknown(
              data['hora_realizacao']!, _hora_realizacaoMeta));
    } else if (isInserting) {
      context.missing(_hora_realizacaoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {partida_id};
  @override
  Partida map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Partida(
      partida_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}partida_id'])!,
      time_mandante: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_mandante'])!,
      time_visitante: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_visitante'])!,
      placar_mandante: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}placar_mandante'])!,
      placar_visitante: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}placar_visitante'])!,
      data_realizacao: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}data_realizacao'])!,
      hora_realizacao: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}hora_realizacao'])!,
    );
  }

  @override
  $PartidasTable createAlias(String alias) {
    return $PartidasTable(attachedDatabase, alias);
  }
}

class Partida extends DataClass implements Insertable<Partida> {
  final int partida_id;
  final int time_mandante;
  final int time_visitante;
  final int placar_mandante;
  final int placar_visitante;
  final String data_realizacao;
  final String hora_realizacao;
  const Partida(
      {required this.partida_id,
      required this.time_mandante,
      required this.time_visitante,
      required this.placar_mandante,
      required this.placar_visitante,
      required this.data_realizacao,
      required this.hora_realizacao});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['partida_id'] = Variable<int>(partida_id);
    map['time_mandante'] = Variable<int>(time_mandante);
    map['time_visitante'] = Variable<int>(time_visitante);
    map['placar_mandante'] = Variable<int>(placar_mandante);
    map['placar_visitante'] = Variable<int>(placar_visitante);
    map['data_realizacao'] = Variable<String>(data_realizacao);
    map['hora_realizacao'] = Variable<String>(hora_realizacao);
    return map;
  }

  PartidasCompanion toCompanion(bool nullToAbsent) {
    return PartidasCompanion(
      partida_id: Value(partida_id),
      time_mandante: Value(time_mandante),
      time_visitante: Value(time_visitante),
      placar_mandante: Value(placar_mandante),
      placar_visitante: Value(placar_visitante),
      data_realizacao: Value(data_realizacao),
      hora_realizacao: Value(hora_realizacao),
    );
  }

  factory Partida.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Partida(
      partida_id: serializer.fromJson<int>(json['partida_id']),
      time_mandante: serializer.fromJson<int>(json['time_mandante']),
      time_visitante: serializer.fromJson<int>(json['time_visitante']),
      placar_mandante: serializer.fromJson<int>(json['placar_mandante']),
      placar_visitante: serializer.fromJson<int>(json['placar_visitante']),
      data_realizacao: serializer.fromJson<String>(json['data_realizacao']),
      hora_realizacao: serializer.fromJson<String>(json['hora_realizacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'partida_id': serializer.toJson<int>(partida_id),
      'time_mandante': serializer.toJson<int>(time_mandante),
      'time_visitante': serializer.toJson<int>(time_visitante),
      'placar_mandante': serializer.toJson<int>(placar_mandante),
      'placar_visitante': serializer.toJson<int>(placar_visitante),
      'data_realizacao': serializer.toJson<String>(data_realizacao),
      'hora_realizacao': serializer.toJson<String>(hora_realizacao),
    };
  }

  Partida copyWith(
          {int? partida_id,
          int? time_mandante,
          int? time_visitante,
          int? placar_mandante,
          int? placar_visitante,
          String? data_realizacao,
          String? hora_realizacao}) =>
      Partida(
        partida_id: partida_id ?? this.partida_id,
        time_mandante: time_mandante ?? this.time_mandante,
        time_visitante: time_visitante ?? this.time_visitante,
        placar_mandante: placar_mandante ?? this.placar_mandante,
        placar_visitante: placar_visitante ?? this.placar_visitante,
        data_realizacao: data_realizacao ?? this.data_realizacao,
        hora_realizacao: hora_realizacao ?? this.hora_realizacao,
      );
  Partida copyWithCompanion(PartidasCompanion data) {
    return Partida(
      partida_id:
          data.partida_id.present ? data.partida_id.value : this.partida_id,
      time_mandante: data.time_mandante.present
          ? data.time_mandante.value
          : this.time_mandante,
      time_visitante: data.time_visitante.present
          ? data.time_visitante.value
          : this.time_visitante,
      placar_mandante: data.placar_mandante.present
          ? data.placar_mandante.value
          : this.placar_mandante,
      placar_visitante: data.placar_visitante.present
          ? data.placar_visitante.value
          : this.placar_visitante,
      data_realizacao: data.data_realizacao.present
          ? data.data_realizacao.value
          : this.data_realizacao,
      hora_realizacao: data.hora_realizacao.present
          ? data.hora_realizacao.value
          : this.hora_realizacao,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Partida(')
          ..write('partida_id: $partida_id, ')
          ..write('time_mandante: $time_mandante, ')
          ..write('time_visitante: $time_visitante, ')
          ..write('placar_mandante: $placar_mandante, ')
          ..write('placar_visitante: $placar_visitante, ')
          ..write('data_realizacao: $data_realizacao, ')
          ..write('hora_realizacao: $hora_realizacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(partida_id, time_mandante, time_visitante,
      placar_mandante, placar_visitante, data_realizacao, hora_realizacao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Partida &&
          other.partida_id == this.partida_id &&
          other.time_mandante == this.time_mandante &&
          other.time_visitante == this.time_visitante &&
          other.placar_mandante == this.placar_mandante &&
          other.placar_visitante == this.placar_visitante &&
          other.data_realizacao == this.data_realizacao &&
          other.hora_realizacao == this.hora_realizacao);
}

class PartidasCompanion extends UpdateCompanion<Partida> {
  final Value<int> partida_id;
  final Value<int> time_mandante;
  final Value<int> time_visitante;
  final Value<int> placar_mandante;
  final Value<int> placar_visitante;
  final Value<String> data_realizacao;
  final Value<String> hora_realizacao;
  const PartidasCompanion({
    this.partida_id = const Value.absent(),
    this.time_mandante = const Value.absent(),
    this.time_visitante = const Value.absent(),
    this.placar_mandante = const Value.absent(),
    this.placar_visitante = const Value.absent(),
    this.data_realizacao = const Value.absent(),
    this.hora_realizacao = const Value.absent(),
  });
  PartidasCompanion.insert({
    this.partida_id = const Value.absent(),
    required int time_mandante,
    required int time_visitante,
    required int placar_mandante,
    required int placar_visitante,
    required String data_realizacao,
    required String hora_realizacao,
  })  : time_mandante = Value(time_mandante),
        time_visitante = Value(time_visitante),
        placar_mandante = Value(placar_mandante),
        placar_visitante = Value(placar_visitante),
        data_realizacao = Value(data_realizacao),
        hora_realizacao = Value(hora_realizacao);
  static Insertable<Partida> custom({
    Expression<int>? partida_id,
    Expression<int>? time_mandante,
    Expression<int>? time_visitante,
    Expression<int>? placar_mandante,
    Expression<int>? placar_visitante,
    Expression<String>? data_realizacao,
    Expression<String>? hora_realizacao,
  }) {
    return RawValuesInsertable({
      if (partida_id != null) 'partida_id': partida_id,
      if (time_mandante != null) 'time_mandante': time_mandante,
      if (time_visitante != null) 'time_visitante': time_visitante,
      if (placar_mandante != null) 'placar_mandante': placar_mandante,
      if (placar_visitante != null) 'placar_visitante': placar_visitante,
      if (data_realizacao != null) 'data_realizacao': data_realizacao,
      if (hora_realizacao != null) 'hora_realizacao': hora_realizacao,
    });
  }

  PartidasCompanion copyWith(
      {Value<int>? partida_id,
      Value<int>? time_mandante,
      Value<int>? time_visitante,
      Value<int>? placar_mandante,
      Value<int>? placar_visitante,
      Value<String>? data_realizacao,
      Value<String>? hora_realizacao}) {
    return PartidasCompanion(
      partida_id: partida_id ?? this.partida_id,
      time_mandante: time_mandante ?? this.time_mandante,
      time_visitante: time_visitante ?? this.time_visitante,
      placar_mandante: placar_mandante ?? this.placar_mandante,
      placar_visitante: placar_visitante ?? this.placar_visitante,
      data_realizacao: data_realizacao ?? this.data_realizacao,
      hora_realizacao: hora_realizacao ?? this.hora_realizacao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (partida_id.present) {
      map['partida_id'] = Variable<int>(partida_id.value);
    }
    if (time_mandante.present) {
      map['time_mandante'] = Variable<int>(time_mandante.value);
    }
    if (time_visitante.present) {
      map['time_visitante'] = Variable<int>(time_visitante.value);
    }
    if (placar_mandante.present) {
      map['placar_mandante'] = Variable<int>(placar_mandante.value);
    }
    if (placar_visitante.present) {
      map['placar_visitante'] = Variable<int>(placar_visitante.value);
    }
    if (data_realizacao.present) {
      map['data_realizacao'] = Variable<String>(data_realizacao.value);
    }
    if (hora_realizacao.present) {
      map['hora_realizacao'] = Variable<String>(hora_realizacao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartidasCompanion(')
          ..write('partida_id: $partida_id, ')
          ..write('time_mandante: $time_mandante, ')
          ..write('time_visitante: $time_visitante, ')
          ..write('placar_mandante: $placar_mandante, ')
          ..write('placar_visitante: $placar_visitante, ')
          ..write('data_realizacao: $data_realizacao, ')
          ..write('hora_realizacao: $hora_realizacao')
          ..write(')'))
        .toString();
  }
}

class $PalpitesTable extends Palpites with TableInfo<$PalpitesTable, Palpite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PalpitesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _palpite_idMeta =
      const VerificationMeta('palpite_id');
  @override
  late final GeneratedColumn<int> palpite_id = GeneratedColumn<int>(
      'palpite_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _partidaIdMeta =
      const VerificationMeta('partidaId');
  @override
  late final GeneratedColumn<int> partidaId = GeneratedColumn<int>(
      'partida_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES partidas (partida_id)'));
  static const VerificationMeta _placarMandantePalpiteMeta =
      const VerificationMeta('placarMandantePalpite');
  @override
  late final GeneratedColumn<int> placarMandantePalpite = GeneratedColumn<int>(
      'placar_mandante_palpite', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _placarVisitantePalpiteMeta =
      const VerificationMeta('placarVisitantePalpite');
  @override
  late final GeneratedColumn<int> placarVisitantePalpite = GeneratedColumn<int>(
      'placar_visitante_palpite', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [palpite_id, partidaId, placarMandantePalpite, placarVisitantePalpite];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'palpites';
  @override
  VerificationContext validateIntegrity(Insertable<Palpite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('palpite_id')) {
      context.handle(
          _palpite_idMeta,
          palpite_id.isAcceptableOrUnknown(
              data['palpite_id']!, _palpite_idMeta));
    }
    if (data.containsKey('partida_id')) {
      context.handle(_partidaIdMeta,
          partidaId.isAcceptableOrUnknown(data['partida_id']!, _partidaIdMeta));
    } else if (isInserting) {
      context.missing(_partidaIdMeta);
    }
    if (data.containsKey('placar_mandante_palpite')) {
      context.handle(
          _placarMandantePalpiteMeta,
          placarMandantePalpite.isAcceptableOrUnknown(
              data['placar_mandante_palpite']!, _placarMandantePalpiteMeta));
    } else if (isInserting) {
      context.missing(_placarMandantePalpiteMeta);
    }
    if (data.containsKey('placar_visitante_palpite')) {
      context.handle(
          _placarVisitantePalpiteMeta,
          placarVisitantePalpite.isAcceptableOrUnknown(
              data['placar_visitante_palpite']!, _placarVisitantePalpiteMeta));
    } else if (isInserting) {
      context.missing(_placarVisitantePalpiteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {palpite_id};
  @override
  Palpite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Palpite(
      palpite_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}palpite_id'])!,
      partidaId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}partida_id'])!,
      placarMandantePalpite: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}placar_mandante_palpite'])!,
      placarVisitantePalpite: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}placar_visitante_palpite'])!,
    );
  }

  @override
  $PalpitesTable createAlias(String alias) {
    return $PalpitesTable(attachedDatabase, alias);
  }
}

class Palpite extends DataClass implements Insertable<Palpite> {
  final int palpite_id;
  final int partidaId;
  final int placarMandantePalpite;
  final int placarVisitantePalpite;
  const Palpite(
      {required this.palpite_id,
      required this.partidaId,
      required this.placarMandantePalpite,
      required this.placarVisitantePalpite});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['palpite_id'] = Variable<int>(palpite_id);
    map['partida_id'] = Variable<int>(partidaId);
    map['placar_mandante_palpite'] = Variable<int>(placarMandantePalpite);
    map['placar_visitante_palpite'] = Variable<int>(placarVisitantePalpite);
    return map;
  }

  PalpitesCompanion toCompanion(bool nullToAbsent) {
    return PalpitesCompanion(
      palpite_id: Value(palpite_id),
      partidaId: Value(partidaId),
      placarMandantePalpite: Value(placarMandantePalpite),
      placarVisitantePalpite: Value(placarVisitantePalpite),
    );
  }

  factory Palpite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Palpite(
      palpite_id: serializer.fromJson<int>(json['palpite_id']),
      partidaId: serializer.fromJson<int>(json['partidaId']),
      placarMandantePalpite:
          serializer.fromJson<int>(json['placarMandantePalpite']),
      placarVisitantePalpite:
          serializer.fromJson<int>(json['placarVisitantePalpite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'palpite_id': serializer.toJson<int>(palpite_id),
      'partidaId': serializer.toJson<int>(partidaId),
      'placarMandantePalpite': serializer.toJson<int>(placarMandantePalpite),
      'placarVisitantePalpite': serializer.toJson<int>(placarVisitantePalpite),
    };
  }

  Palpite copyWith(
          {int? palpite_id,
          int? partidaId,
          int? placarMandantePalpite,
          int? placarVisitantePalpite}) =>
      Palpite(
        palpite_id: palpite_id ?? this.palpite_id,
        partidaId: partidaId ?? this.partidaId,
        placarMandantePalpite:
            placarMandantePalpite ?? this.placarMandantePalpite,
        placarVisitantePalpite:
            placarVisitantePalpite ?? this.placarVisitantePalpite,
      );
  Palpite copyWithCompanion(PalpitesCompanion data) {
    return Palpite(
      palpite_id:
          data.palpite_id.present ? data.palpite_id.value : this.palpite_id,
      partidaId: data.partidaId.present ? data.partidaId.value : this.partidaId,
      placarMandantePalpite: data.placarMandantePalpite.present
          ? data.placarMandantePalpite.value
          : this.placarMandantePalpite,
      placarVisitantePalpite: data.placarVisitantePalpite.present
          ? data.placarVisitantePalpite.value
          : this.placarVisitantePalpite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Palpite(')
          ..write('palpite_id: $palpite_id, ')
          ..write('partidaId: $partidaId, ')
          ..write('placarMandantePalpite: $placarMandantePalpite, ')
          ..write('placarVisitantePalpite: $placarVisitantePalpite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      palpite_id, partidaId, placarMandantePalpite, placarVisitantePalpite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Palpite &&
          other.palpite_id == this.palpite_id &&
          other.partidaId == this.partidaId &&
          other.placarMandantePalpite == this.placarMandantePalpite &&
          other.placarVisitantePalpite == this.placarVisitantePalpite);
}

class PalpitesCompanion extends UpdateCompanion<Palpite> {
  final Value<int> palpite_id;
  final Value<int> partidaId;
  final Value<int> placarMandantePalpite;
  final Value<int> placarVisitantePalpite;
  const PalpitesCompanion({
    this.palpite_id = const Value.absent(),
    this.partidaId = const Value.absent(),
    this.placarMandantePalpite = const Value.absent(),
    this.placarVisitantePalpite = const Value.absent(),
  });
  PalpitesCompanion.insert({
    this.palpite_id = const Value.absent(),
    required int partidaId,
    required int placarMandantePalpite,
    required int placarVisitantePalpite,
  })  : partidaId = Value(partidaId),
        placarMandantePalpite = Value(placarMandantePalpite),
        placarVisitantePalpite = Value(placarVisitantePalpite);
  static Insertable<Palpite> custom({
    Expression<int>? palpite_id,
    Expression<int>? partidaId,
    Expression<int>? placarMandantePalpite,
    Expression<int>? placarVisitantePalpite,
  }) {
    return RawValuesInsertable({
      if (palpite_id != null) 'palpite_id': palpite_id,
      if (partidaId != null) 'partida_id': partidaId,
      if (placarMandantePalpite != null)
        'placar_mandante_palpite': placarMandantePalpite,
      if (placarVisitantePalpite != null)
        'placar_visitante_palpite': placarVisitantePalpite,
    });
  }

  PalpitesCompanion copyWith(
      {Value<int>? palpite_id,
      Value<int>? partidaId,
      Value<int>? placarMandantePalpite,
      Value<int>? placarVisitantePalpite}) {
    return PalpitesCompanion(
      palpite_id: palpite_id ?? this.palpite_id,
      partidaId: partidaId ?? this.partidaId,
      placarMandantePalpite:
          placarMandantePalpite ?? this.placarMandantePalpite,
      placarVisitantePalpite:
          placarVisitantePalpite ?? this.placarVisitantePalpite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (palpite_id.present) {
      map['palpite_id'] = Variable<int>(palpite_id.value);
    }
    if (partidaId.present) {
      map['partida_id'] = Variable<int>(partidaId.value);
    }
    if (placarMandantePalpite.present) {
      map['placar_mandante_palpite'] =
          Variable<int>(placarMandantePalpite.value);
    }
    if (placarVisitantePalpite.present) {
      map['placar_visitante_palpite'] =
          Variable<int>(placarVisitantePalpite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PalpitesCompanion(')
          ..write('palpite_id: $palpite_id, ')
          ..write('partidaId: $partidaId, ')
          ..write('placarMandantePalpite: $placarMandantePalpite, ')
          ..write('placarVisitantePalpite: $placarVisitantePalpite')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TimesTable times = $TimesTable(this);
  late final $PartidasTable partidas = $PartidasTable(this);
  late final $PalpitesTable palpites = $PalpitesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [times, partidas, palpites];
}

typedef $$TimesTableCreateCompanionBuilder = TimesCompanion Function({
  Value<int> time_id,
  required String nome_popular,
  required String sigla,
  required String escudo,
});
typedef $$TimesTableUpdateCompanionBuilder = TimesCompanion Function({
  Value<int> time_id,
  Value<String> nome_popular,
  Value<String> sigla,
  Value<String> escudo,
});

class $$TimesTableFilterComposer extends Composer<_$AppDatabase, $TimesTable> {
  $$TimesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get time_id => $composableBuilder(
      column: $table.time_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nome_popular => $composableBuilder(
      column: $table.nome_popular, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sigla => $composableBuilder(
      column: $table.sigla, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get escudo => $composableBuilder(
      column: $table.escudo, builder: (column) => ColumnFilters(column));
}

class $$TimesTableOrderingComposer
    extends Composer<_$AppDatabase, $TimesTable> {
  $$TimesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get time_id => $composableBuilder(
      column: $table.time_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nome_popular => $composableBuilder(
      column: $table.nome_popular,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sigla => $composableBuilder(
      column: $table.sigla, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get escudo => $composableBuilder(
      column: $table.escudo, builder: (column) => ColumnOrderings(column));
}

class $$TimesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimesTable> {
  $$TimesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get time_id =>
      $composableBuilder(column: $table.time_id, builder: (column) => column);

  GeneratedColumn<String> get nome_popular => $composableBuilder(
      column: $table.nome_popular, builder: (column) => column);

  GeneratedColumn<String> get sigla =>
      $composableBuilder(column: $table.sigla, builder: (column) => column);

  GeneratedColumn<String> get escudo =>
      $composableBuilder(column: $table.escudo, builder: (column) => column);
}

class $$TimesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TimesTable,
    Time,
    $$TimesTableFilterComposer,
    $$TimesTableOrderingComposer,
    $$TimesTableAnnotationComposer,
    $$TimesTableCreateCompanionBuilder,
    $$TimesTableUpdateCompanionBuilder,
    (Time, BaseReferences<_$AppDatabase, $TimesTable, Time>),
    Time,
    PrefetchHooks Function()> {
  $$TimesTableTableManager(_$AppDatabase db, $TimesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> time_id = const Value.absent(),
            Value<String> nome_popular = const Value.absent(),
            Value<String> sigla = const Value.absent(),
            Value<String> escudo = const Value.absent(),
          }) =>
              TimesCompanion(
            time_id: time_id,
            nome_popular: nome_popular,
            sigla: sigla,
            escudo: escudo,
          ),
          createCompanionCallback: ({
            Value<int> time_id = const Value.absent(),
            required String nome_popular,
            required String sigla,
            required String escudo,
          }) =>
              TimesCompanion.insert(
            time_id: time_id,
            nome_popular: nome_popular,
            sigla: sigla,
            escudo: escudo,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TimesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TimesTable,
    Time,
    $$TimesTableFilterComposer,
    $$TimesTableOrderingComposer,
    $$TimesTableAnnotationComposer,
    $$TimesTableCreateCompanionBuilder,
    $$TimesTableUpdateCompanionBuilder,
    (Time, BaseReferences<_$AppDatabase, $TimesTable, Time>),
    Time,
    PrefetchHooks Function()>;
typedef $$PartidasTableCreateCompanionBuilder = PartidasCompanion Function({
  Value<int> partida_id,
  required int time_mandante,
  required int time_visitante,
  required int placar_mandante,
  required int placar_visitante,
  required String data_realizacao,
  required String hora_realizacao,
});
typedef $$PartidasTableUpdateCompanionBuilder = PartidasCompanion Function({
  Value<int> partida_id,
  Value<int> time_mandante,
  Value<int> time_visitante,
  Value<int> placar_mandante,
  Value<int> placar_visitante,
  Value<String> data_realizacao,
  Value<String> hora_realizacao,
});

final class $$PartidasTableReferences
    extends BaseReferences<_$AppDatabase, $PartidasTable, Partida> {
  $$PartidasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TimesTable _time_mandanteTable(_$AppDatabase db) =>
      db.times.createAlias(
          $_aliasNameGenerator(db.partidas.time_mandante, db.times.time_id));

  $$TimesTableProcessedTableManager get time_mandante {
    final manager = $$TimesTableTableManager($_db, $_db.times)
        .filter((f) => f.time_id($_item.time_mandante!));
    final item = $_typedResult.readTableOrNull(_time_mandanteTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TimesTable _time_visitanteTable(_$AppDatabase db) =>
      db.times.createAlias(
          $_aliasNameGenerator(db.partidas.time_visitante, db.times.time_id));

  $$TimesTableProcessedTableManager get time_visitante {
    final manager = $$TimesTableTableManager($_db, $_db.times)
        .filter((f) => f.time_id($_item.time_visitante!));
    final item = $_typedResult.readTableOrNull(_time_visitanteTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$PalpitesTable, List<Palpite>> _palpitesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.palpites,
          aliasName: $_aliasNameGenerator(
              db.partidas.partida_id, db.palpites.partidaId));

  $$PalpitesTableProcessedTableManager get palpitesRefs {
    final manager = $$PalpitesTableTableManager($_db, $_db.palpites)
        .filter((f) => f.partidaId.partida_id($_item.partida_id));

    final cache = $_typedResult.readTableOrNull(_palpitesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PartidasTableFilterComposer
    extends Composer<_$AppDatabase, $PartidasTable> {
  $$PartidasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get partida_id => $composableBuilder(
      column: $table.partida_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get placar_mandante => $composableBuilder(
      column: $table.placar_mandante,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get placar_visitante => $composableBuilder(
      column: $table.placar_visitante,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get data_realizacao => $composableBuilder(
      column: $table.data_realizacao,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hora_realizacao => $composableBuilder(
      column: $table.hora_realizacao,
      builder: (column) => ColumnFilters(column));

  $$TimesTableFilterComposer get time_mandante {
    final $$TimesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.time_mandante,
        referencedTable: $db.times,
        getReferencedColumn: (t) => t.time_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimesTableFilterComposer(
              $db: $db,
              $table: $db.times,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimesTableFilterComposer get time_visitante {
    final $$TimesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.time_visitante,
        referencedTable: $db.times,
        getReferencedColumn: (t) => t.time_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimesTableFilterComposer(
              $db: $db,
              $table: $db.times,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> palpitesRefs(
      Expression<bool> Function($$PalpitesTableFilterComposer f) f) {
    final $$PalpitesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.partida_id,
        referencedTable: $db.palpites,
        getReferencedColumn: (t) => t.partidaId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PalpitesTableFilterComposer(
              $db: $db,
              $table: $db.palpites,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PartidasTableOrderingComposer
    extends Composer<_$AppDatabase, $PartidasTable> {
  $$PartidasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get partida_id => $composableBuilder(
      column: $table.partida_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get placar_mandante => $composableBuilder(
      column: $table.placar_mandante,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get placar_visitante => $composableBuilder(
      column: $table.placar_visitante,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data_realizacao => $composableBuilder(
      column: $table.data_realizacao,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hora_realizacao => $composableBuilder(
      column: $table.hora_realizacao,
      builder: (column) => ColumnOrderings(column));

  $$TimesTableOrderingComposer get time_mandante {
    final $$TimesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.time_mandante,
        referencedTable: $db.times,
        getReferencedColumn: (t) => t.time_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimesTableOrderingComposer(
              $db: $db,
              $table: $db.times,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimesTableOrderingComposer get time_visitante {
    final $$TimesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.time_visitante,
        referencedTable: $db.times,
        getReferencedColumn: (t) => t.time_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimesTableOrderingComposer(
              $db: $db,
              $table: $db.times,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PartidasTableAnnotationComposer
    extends Composer<_$AppDatabase, $PartidasTable> {
  $$PartidasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get partida_id => $composableBuilder(
      column: $table.partida_id, builder: (column) => column);

  GeneratedColumn<int> get placar_mandante => $composableBuilder(
      column: $table.placar_mandante, builder: (column) => column);

  GeneratedColumn<int> get placar_visitante => $composableBuilder(
      column: $table.placar_visitante, builder: (column) => column);

  GeneratedColumn<String> get data_realizacao => $composableBuilder(
      column: $table.data_realizacao, builder: (column) => column);

  GeneratedColumn<String> get hora_realizacao => $composableBuilder(
      column: $table.hora_realizacao, builder: (column) => column);

  $$TimesTableAnnotationComposer get time_mandante {
    final $$TimesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.time_mandante,
        referencedTable: $db.times,
        getReferencedColumn: (t) => t.time_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimesTableAnnotationComposer(
              $db: $db,
              $table: $db.times,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimesTableAnnotationComposer get time_visitante {
    final $$TimesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.time_visitante,
        referencedTable: $db.times,
        getReferencedColumn: (t) => t.time_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimesTableAnnotationComposer(
              $db: $db,
              $table: $db.times,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> palpitesRefs<T extends Object>(
      Expression<T> Function($$PalpitesTableAnnotationComposer a) f) {
    final $$PalpitesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.partida_id,
        referencedTable: $db.palpites,
        getReferencedColumn: (t) => t.partidaId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PalpitesTableAnnotationComposer(
              $db: $db,
              $table: $db.palpites,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PartidasTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PartidasTable,
    Partida,
    $$PartidasTableFilterComposer,
    $$PartidasTableOrderingComposer,
    $$PartidasTableAnnotationComposer,
    $$PartidasTableCreateCompanionBuilder,
    $$PartidasTableUpdateCompanionBuilder,
    (Partida, $$PartidasTableReferences),
    Partida,
    PrefetchHooks Function(
        {bool time_mandante, bool time_visitante, bool palpitesRefs})> {
  $$PartidasTableTableManager(_$AppDatabase db, $PartidasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartidasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartidasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PartidasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> partida_id = const Value.absent(),
            Value<int> time_mandante = const Value.absent(),
            Value<int> time_visitante = const Value.absent(),
            Value<int> placar_mandante = const Value.absent(),
            Value<int> placar_visitante = const Value.absent(),
            Value<String> data_realizacao = const Value.absent(),
            Value<String> hora_realizacao = const Value.absent(),
          }) =>
              PartidasCompanion(
            partida_id: partida_id,
            time_mandante: time_mandante,
            time_visitante: time_visitante,
            placar_mandante: placar_mandante,
            placar_visitante: placar_visitante,
            data_realizacao: data_realizacao,
            hora_realizacao: hora_realizacao,
          ),
          createCompanionCallback: ({
            Value<int> partida_id = const Value.absent(),
            required int time_mandante,
            required int time_visitante,
            required int placar_mandante,
            required int placar_visitante,
            required String data_realizacao,
            required String hora_realizacao,
          }) =>
              PartidasCompanion.insert(
            partida_id: partida_id,
            time_mandante: time_mandante,
            time_visitante: time_visitante,
            placar_mandante: placar_mandante,
            placar_visitante: placar_visitante,
            data_realizacao: data_realizacao,
            hora_realizacao: hora_realizacao,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PartidasTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {time_mandante = false,
              time_visitante = false,
              palpitesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (palpitesRefs) db.palpites],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (time_mandante) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.time_mandante,
                    referencedTable:
                        $$PartidasTableReferences._time_mandanteTable(db),
                    referencedColumn: $$PartidasTableReferences
                        ._time_mandanteTable(db)
                        .time_id,
                  ) as T;
                }
                if (time_visitante) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.time_visitante,
                    referencedTable:
                        $$PartidasTableReferences._time_visitanteTable(db),
                    referencedColumn: $$PartidasTableReferences
                        ._time_visitanteTable(db)
                        .time_id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (palpitesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PartidasTableReferences._palpitesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PartidasTableReferences(db, table, p0)
                                .palpitesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.partidaId == item.partida_id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PartidasTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PartidasTable,
    Partida,
    $$PartidasTableFilterComposer,
    $$PartidasTableOrderingComposer,
    $$PartidasTableAnnotationComposer,
    $$PartidasTableCreateCompanionBuilder,
    $$PartidasTableUpdateCompanionBuilder,
    (Partida, $$PartidasTableReferences),
    Partida,
    PrefetchHooks Function(
        {bool time_mandante, bool time_visitante, bool palpitesRefs})>;
typedef $$PalpitesTableCreateCompanionBuilder = PalpitesCompanion Function({
  Value<int> palpite_id,
  required int partidaId,
  required int placarMandantePalpite,
  required int placarVisitantePalpite,
});
typedef $$PalpitesTableUpdateCompanionBuilder = PalpitesCompanion Function({
  Value<int> palpite_id,
  Value<int> partidaId,
  Value<int> placarMandantePalpite,
  Value<int> placarVisitantePalpite,
});

final class $$PalpitesTableReferences
    extends BaseReferences<_$AppDatabase, $PalpitesTable, Palpite> {
  $$PalpitesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PartidasTable _partidaIdTable(_$AppDatabase db) =>
      db.partidas.createAlias(
          $_aliasNameGenerator(db.palpites.partidaId, db.partidas.partida_id));

  $$PartidasTableProcessedTableManager get partidaId {
    final manager = $$PartidasTableTableManager($_db, $_db.partidas)
        .filter((f) => f.partida_id($_item.partidaId!));
    final item = $_typedResult.readTableOrNull(_partidaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PalpitesTableFilterComposer
    extends Composer<_$AppDatabase, $PalpitesTable> {
  $$PalpitesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get palpite_id => $composableBuilder(
      column: $table.palpite_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get placarMandantePalpite => $composableBuilder(
      column: $table.placarMandantePalpite,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get placarVisitantePalpite => $composableBuilder(
      column: $table.placarVisitantePalpite,
      builder: (column) => ColumnFilters(column));

  $$PartidasTableFilterComposer get partidaId {
    final $$PartidasTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.partidaId,
        referencedTable: $db.partidas,
        getReferencedColumn: (t) => t.partida_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PartidasTableFilterComposer(
              $db: $db,
              $table: $db.partidas,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PalpitesTableOrderingComposer
    extends Composer<_$AppDatabase, $PalpitesTable> {
  $$PalpitesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get palpite_id => $composableBuilder(
      column: $table.palpite_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get placarMandantePalpite => $composableBuilder(
      column: $table.placarMandantePalpite,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get placarVisitantePalpite => $composableBuilder(
      column: $table.placarVisitantePalpite,
      builder: (column) => ColumnOrderings(column));

  $$PartidasTableOrderingComposer get partidaId {
    final $$PartidasTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.partidaId,
        referencedTable: $db.partidas,
        getReferencedColumn: (t) => t.partida_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PartidasTableOrderingComposer(
              $db: $db,
              $table: $db.partidas,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PalpitesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PalpitesTable> {
  $$PalpitesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get palpite_id => $composableBuilder(
      column: $table.palpite_id, builder: (column) => column);

  GeneratedColumn<int> get placarMandantePalpite => $composableBuilder(
      column: $table.placarMandantePalpite, builder: (column) => column);

  GeneratedColumn<int> get placarVisitantePalpite => $composableBuilder(
      column: $table.placarVisitantePalpite, builder: (column) => column);

  $$PartidasTableAnnotationComposer get partidaId {
    final $$PartidasTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.partidaId,
        referencedTable: $db.partidas,
        getReferencedColumn: (t) => t.partida_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PartidasTableAnnotationComposer(
              $db: $db,
              $table: $db.partidas,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PalpitesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PalpitesTable,
    Palpite,
    $$PalpitesTableFilterComposer,
    $$PalpitesTableOrderingComposer,
    $$PalpitesTableAnnotationComposer,
    $$PalpitesTableCreateCompanionBuilder,
    $$PalpitesTableUpdateCompanionBuilder,
    (Palpite, $$PalpitesTableReferences),
    Palpite,
    PrefetchHooks Function({bool partidaId})> {
  $$PalpitesTableTableManager(_$AppDatabase db, $PalpitesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PalpitesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PalpitesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PalpitesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> palpite_id = const Value.absent(),
            Value<int> partidaId = const Value.absent(),
            Value<int> placarMandantePalpite = const Value.absent(),
            Value<int> placarVisitantePalpite = const Value.absent(),
          }) =>
              PalpitesCompanion(
            palpite_id: palpite_id,
            partidaId: partidaId,
            placarMandantePalpite: placarMandantePalpite,
            placarVisitantePalpite: placarVisitantePalpite,
          ),
          createCompanionCallback: ({
            Value<int> palpite_id = const Value.absent(),
            required int partidaId,
            required int placarMandantePalpite,
            required int placarVisitantePalpite,
          }) =>
              PalpitesCompanion.insert(
            palpite_id: palpite_id,
            partidaId: partidaId,
            placarMandantePalpite: placarMandantePalpite,
            placarVisitantePalpite: placarVisitantePalpite,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PalpitesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({partidaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (partidaId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.partidaId,
                    referencedTable:
                        $$PalpitesTableReferences._partidaIdTable(db),
                    referencedColumn: $$PalpitesTableReferences
                        ._partidaIdTable(db)
                        .partida_id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PalpitesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PalpitesTable,
    Palpite,
    $$PalpitesTableFilterComposer,
    $$PalpitesTableOrderingComposer,
    $$PalpitesTableAnnotationComposer,
    $$PalpitesTableCreateCompanionBuilder,
    $$PalpitesTableUpdateCompanionBuilder,
    (Palpite, $$PalpitesTableReferences),
    Palpite,
    PrefetchHooks Function({bool partidaId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TimesTableTableManager get times =>
      $$TimesTableTableManager(_db, _db.times);
  $$PartidasTableTableManager get partidas =>
      $$PartidasTableTableManager(_db, _db.partidas);
  $$PalpitesTableTableManager get palpites =>
      $$PalpitesTableTableManager(_db, _db.palpites);
}
