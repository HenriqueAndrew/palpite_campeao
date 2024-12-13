import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:palpite_campeao/source/local/Database.dart';

class Offline extends StatefulWidget {
  const Offline({Key? key}) : super(key: key);

  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  final database = AppDatabase();

  List<PartidaComTimes> partidas = [];

  @override
  void initState() {
    super.initState();
    _carregarPartidasOffline();
  }

  Future<void> _carregarPartidasOffline() async {

    final timeMandanteAlias = database.times.createAlias('mandante');
    final timeVisitanteAlias = database.times.createAlias('visitante');

    final partidasOffline = database.select(database.partidas).join([
      drift.leftOuterJoin(
        timeMandanteAlias,
        timeMandanteAlias.time_id.equalsExp(database.partidas.time_mandante),
      ),
      drift.leftOuterJoin(
        timeVisitanteAlias,
        timeVisitanteAlias.time_id.equalsExp(database.partidas.time_visitante),
      ),
    ]);

    final results = await partidasOffline.get();

    final partidasBuscadas = results.map((row) {
      final partida = row.readTable(database.partidas);
      final mandante = row.readTable(timeMandanteAlias);
      final visitante = row.readTableOrNull(timeVisitanteAlias);

      return PartidaComTimes(
        partida: partida,
        mandante: mandante,
        visitante: visitante,
      );
    }).toList();

    setState(() {
      partidas = partidasBuscadas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return partidas.isEmpty
        ? const Center(child: Text("Nenhuma partida salva"))
        : ListView.separated(
      itemBuilder: (context, index) {
        final partidaComTimes = partidas[index];
        return GestureDetector(
          onLongPress: (){
            Navigator.pushNamed(
                context,
                '/palpite',
                arguments: {
                  'partidaId': partidaComTimes.partida.partida_id,
                  'timeMandantePalpite': partidaComTimes.mandante?.nome_popular?? '',
                  'timeVisitantePalpite': partidaComTimes.visitante?.nome_popular ?? '',
                },
            );
          },
          child: Card(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(partidaComTimes.mandante?.nome_popular ?? ''),
                  Text("${partidaComTimes.partida.placar_mandante} x ${partidaComTimes.partida.placar_visitante}"),
                  Text(partidaComTimes.visitante?.nome_popular ?? ''),
                ],
              ),
              subtitle: Text("${partidaComTimes.partida.data_realizacao} às ${partidaComTimes.partida.hora_realizacao}"),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: partidas.length,
    );
  }
}

class PartidaComTimes {
  final Partida partida;
  final Time? mandante;
  final Time? visitante;

  PartidaComTimes({
    required this.partida,
    this.mandante,
    this.visitante,
  });
}