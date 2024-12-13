import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:palpite_campeao/source/local/Database.dart';
import 'package:palpite_campeao/model/Partida.dart' as model;
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

  final TextEditingController timeController = TextEditingController();
  List<model.Partida> partidas = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    client = RestClient(dio);
    _carregarPartidas();
  }

  Future<void> _carregarPartidas() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Buscando todas as partidas
      print("[DEBUG] Iniciando requisição para /partidas");
      final todasPartidas = await client.getPartidas();
      print("[DEBUG] Requisição bem-sucedida. Dados retornados: $todasPartidas");

      // Salvando as partidas no banco de dados local
      for (var partida in todasPartidas) {
        await _salvarPartidaNoBanco(partida);
      }

      setState(() {
        partidas = todasPartidas;
        isLoading = false;
      });
    } catch (e) {
      print("[DEBUG] Erro na requisição: $e");
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao carregar partidas: $e")),
      );
    }
  }

  Future<void> _buscarPartidaPorTime() async {
    setState(() {
      isLoading = true;
    });

    try {
      String nomeTime = timeController.text.trim();
      if (nomeTime.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Digite o nome do time")),
        );
        setState(() {
          isLoading = false;
        });
        return;
      }

      // Buscando a partida por time via API
      final partidasDoTime = await client.getPartidasPorTime(nomeTime);

      // Inserindo os times no banco de dados
      for (var partida in partidasDoTime){
        await _salvarPartidaNoBanco(partida);
      }

      setState(() {
        partidas = partidasDoTime;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      String errorMessage = e is DioError && e.error != null
          ? e.error.toString()
          : "Erro ao buscar partida: $e";

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
    }
  }

  Future<void> _salvarPartidaNoBanco(model.Partida partida) async {
    try {
      // Inserindo os times no banco de dados
      await database.into(database.times).insertOnConflictUpdate(
        TimesCompanion(
          time_id: drift.Value(partida.time_mandante.time_id),
          nome_popular: drift.Value(partida.time_mandante.nome_popular),
          sigla: drift.Value(partida.time_mandante.sigla),
          escudo: drift.Value(partida.time_mandante.escudo),
        ),
      );

      await database.into(database.times).insertOnConflictUpdate(
        TimesCompanion(
          time_id: drift.Value(partida.time_visitante.time_id),
          nome_popular: drift.Value(partida.time_visitante.nome_popular),
          sigla: drift.Value(partida.time_visitante.sigla),
          escudo: drift.Value(partida.time_visitante.escudo),
        ),
      );

      // Inserindo a partida no banco de dados
      await database.into(database.partidas).insertOnConflictUpdate(
        PartidasCompanion(
          partida_id: drift.Value(partida.partida_id!),
          time_mandante: drift.Value(partida.time_mandante.time_id!),
          time_visitante: drift.Value(partida.time_visitante.time_id!),
          placar_mandante: drift.Value(partida.placar_mandante?? 0),
          placar_visitante: drift.Value(partida.placar_visitante?? 0),
          data_realizacao: drift.Value(partida.data_realizacao),
          hora_realizacao: drift.Value(partida.hora_realizacao),
        ),
      );
    } catch (e) {
      print("Erro ao salvar partida no banco: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partidas Online'),
      ),
      body: RefreshIndicator(
        onRefresh: _carregarPartidas,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: timeController,
                    decoration: const InputDecoration(
                      labelText: "Buscar partida por nome do time",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height:10),
                  ElevatedButton(
                      onPressed: isLoading ? null : _buscarPartidaPorTime,
                      child: isLoading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : const Text("Buscar partidas"),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : partidas.isEmpty
                              ? const Center(
                                  child: Text("Nenhuma partida encontrada."),
                                )
                              : ListView.builder(
                                  itemCount: partidas.length,
                                  itemBuilder: (context, index) {
                                    final partida = partidas[index];
                                    return GestureDetector(
                                      onLongPress: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/palpite',
                                          arguments: {
                                            'partidaId': partida.partida_id,
                                            'timeMandantePalpite': partida.time_mandante.nome_popular,
                                            'timeVisitantePalpite': partida.time_visitante.nome_popular,
                                          },
                                        );
                                      },
                                    child: Card(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 8.0),
                                      child: ListTile(
                                        leading: Image.network(
                                          partida.time_mandante.escudo ?? '',
                                          width: 35,
                                          height: 35,
                                          errorBuilder: (context, error, stackTrace){
                                            return const Icon(Icons.error, size: 35);
                                          },
                                        ),
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(partida.time_mandante.nome_popular),
                                            Text("${partida.placar_mandante} x ${partida.placar_visitante}"),
                                            Text(partida.time_visitante.nome_popular),
                                          ],
                                        ),
                                        trailing: Image.network(
                                          partida.time_visitante.escudo ?? '',
                                          width: 35,
                                          height: 35,
                                          errorBuilder: (context, error, stackTrace){
                                            return const Icon(Icons.error, size: 35);
                                          },
                                        ),
                                        subtitle: Text("${partida.data_realizacao} às ${partida.hora_realizacao}"),
                                      ),
                                      ),
                                    );
                                  },
                              ),
                  ),
                ],
              ),
          ),
      ),
    );
  }
}