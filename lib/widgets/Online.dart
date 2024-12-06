import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:palpite_campeao/source/local/Database.dart';
import 'package:palpite_campeao/model/Partida.dart' as model;
import 'package:palpite_campeao/model/Time.dart' as model;
import 'package:palpite_campeao/source/remote/rest_client.dart';

class Online extends StatefulWidget {

  const Online({Key? key}) : super(key: key);

  @override
  _OnlineState createState() => _OnlineState();
}

class _OnlineState extends State<Online>{
  final dio = Dio();
  late RestClient client;
  final database = AppDatabase();

  final TextEditingController partidaIdController = TextEditingController();

  model.Partida? partida;
  model.Time? timeMandante;
  model.Time? timeVisitante;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    client = RestClient(dio);
  }

  Future<void> buscarPartida() async {
    setState(() {
      isLoading = true;
    });

    try {
      String partidaId = partidaIdController.text.trim();
      if (partidaId.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Digite o ID da partida")),
        );
        setState(() {
          isLoading = false;
        });
        return;
      }

      // Buscando a partida via API
      final partidaBuscada = await client.getPartida(partidaId);
      final timeMantanteBuscado = partidaBuscada.time_mandante;
      final timeVisitanteBuscado = partidaBuscada.time_visitante;

      // Inserindo os times no banco de dados
      await database.into(database.times).insert(
        TimesCompanion(
          time_id: drift.Value(timeMantanteBuscado.time_id),
          nome_popular: drift.Value(timeMantanteBuscado.nome_popular),
          sigla: drift.Value(timeMantanteBuscado.sigla),
          escudo: drift.Value(timeMantanteBuscado.escudo),
        ),
      );

      await database.into(database.times).insert(
        TimesCompanion(
          time_id: drift.Value(timeVisitanteBuscado.time_id),
          nome_popular: drift.Value(timeVisitanteBuscado.nome_popular),
          sigla: drift.Value(timeVisitanteBuscado.sigla),
          escudo: drift.Value(timeVisitanteBuscado.escudo),
        ),
      );

      // Inserindo a partida no banco de dados
      await database.into(database.partidas).insert(
        PartidasCompanion(
          partida_id: drift.Value(partidaBuscada.partida_id!),
          time_mandante: drift.Value(timeMantanteBuscado.time_id!),
          time_visitante: drift.Value(timeVisitanteBuscado.time_id!),
          placar_mandante: drift.Value(partidaBuscada.placar_mandante?? 0),
          placar_visitante: drift.Value(partidaBuscada.placar_visitante?? 0),
          data_realizacao: drift.Value(partidaBuscada.data_realizacao),
          hora_realizacao: drift.Value(partidaBuscada.hora_realizacao),
        ),
      );

      setState(() {
        partida = partidaBuscada;
        timeMandante = timeMantanteBuscado;
        timeVisitante = timeVisitanteBuscado;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao buscar partida: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Partida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: partidaIdController,
              decoration: const InputDecoration(
                labelText: "ID da Partida",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            //botao para buscar a partida
            ElevatedButton(
              onPressed: isLoading ? null : buscarPartida,
              child: isLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : const Text("Buscar partida"),
            ),
            const SizedBox(height: 20),
            //Exibir dados da partida se disponível
            partida != null && timeMandante != null && timeVisitante != null
                ? Column(
                    children: [
                      Text(
                        '${partida!.data_realizacao} às ${partida!.hora_realizacao}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //Time mandante
                              Column(
                                children: [
                                  Image.network(
                                    timeMandante!.escudo,
                                    width: 50,
                                    height: 50,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    timeMandante!.nome_popular,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${partida!.placar_mandante}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              const Text(
                                'x',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              //Time visitante
                              Column(
                                children: [
                                  Image.network(
                                    timeVisitante!.escudo,
                                    width: 50,
                                    height: 50,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    timeVisitante!.nome_popular,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${partida!.placar_visitante}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}