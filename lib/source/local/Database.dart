import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'Database.g.dart';

class Times extends Table{
  IntColumn get time_id => integer().autoIncrement()();
  TextColumn get nome_popular => text()();
  TextColumn get sigla => text()();
  TextColumn get escudo => text()();
}

class Partidas extends Table {
  IntColumn get partida_id => integer().autoIncrement()();
  IntColumn get time_mandante => integer().references(Times, #time_id)();
  IntColumn get time_visitante => integer().references(Times, #time_id)();
  IntColumn get placar_mandante => integer()();
  IntColumn get placar_visitante => integer()();
  TextColumn get data_realizacao => text()();
  TextColumn get hora_realizacao => text()();
}

class Palpites extends Table {
  IntColumn get palpite_id => integer().autoIncrement()();
  IntColumn get partidaId => integer().references(Partidas, #partida_id)();
  IntColumn get placarMandantePalpite => integer()();
  IntColumn get placarVisitantePalpite => integer()();
}

@DriftDatabase(tables: [Partidas, Times, Palpites])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'databasePalpiteCampeao');
  }
}