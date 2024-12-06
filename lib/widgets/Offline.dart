import 'package:flutter/material.dart';
import 'package:palpite_campeao/model/Partida.dart' as model;
import 'package:palpite_campeao/model/Time.dart' as model;
import 'package:palpite_campeao/source/local/Database.dart';

class Offline extends StatefulWidget {
  const Offline({Key? key}) : super(key: key);

  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  final database = AppDatabase();

  List<model.Partida> partidas = [];

  @override
  void initState() {
    super.initState();
    _loadPartidas();
  }

  Future<void> _loadPartidas() async {
    final allPartidas = await database.select(database.partidas).get();

    List<model.Partida> partidasBuscadas = [];
    for (var partida in allPartidas){
      final mandante = await (database.select(database.times)
      ..where((t) => t.time_id.equals(partida.time_mandante))).getSingleOrNull();
      final visitante = await (database.select(database.times)
      ..where((t) => t.time_id.equals(partida.time_visitante))).getSingleOrNull();

      if(mandante != null && visitante != null){
        partidasBuscadas.add(model.Partida(
          partida_id: partida.partida_id,
          time_mandante: model.Time(
            time_id: mandante.time_id,
            nome_popular: mandante.nome_popular,
            sigla: mandante.sigla,
            escudo: mandante.escudo,
          ),
          time_visitante: model.Time(
            time_id: visitante.time_id,
            nome_popular: visitante.nome_popular,
            sigla: visitante.sigla,
            escudo: visitante.escudo,
          ),
          placar_mandante: partida.placar_mandante,
          placar_visitante: partida.placar_visitante,
          data_realizacao: partida.data_realizacao,
          hora_realizacao: partida.hora_realizacao,
        ));
      }
    }

    setState(() {
      partidas = partidasBuscadas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return partidas.isEmpty
    ? const Center(child: Text("Nenhuma partida salva"))
    : ListView.separated(
        itemBuilder: (context, index){
          final partida = partidas[index];
          return ListTile(
            title: Row(
              children: [
                //Time mandante
                Column(
                  children:[
                    Image.network(
                      partida.time_mandante.escudo,
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(height: 4),
                    Text(partida.time_mandante.nome_popular),
                    Text(partida.placar_mandante.toString()),
                  ],
                ),
                const SizedBox(width: 10),
                const Text('x'),
                const SizedBox(width: 10),
                //Time visitante
                Column(
                  children:[
                    Image.network(
                      partida.time_visitante.escudo,
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(height: 4),
                    Text(partida.time_visitante.nome_popular),
                    Text(partida.placar_visitante.toString()),
                  ],
                ),
              ],
            ),
            subtitle: Text('${partida.data_realizacao} ${partida.hora_realizacao}'),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: partidas.length,
    );
  }
}