import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:palpite_campeao/source/local/Database.dart';

class RegistroPalpite extends StatefulWidget {
  final String timeMandantePalpite;
  final String timeVisitantePalpite;
  final int partidaId;

  const RegistroPalpite({
    Key? key,
    required this.timeMandantePalpite,
    required this.timeVisitantePalpite,
    required this.partidaId,
  }) : super(key: key);

  @override
  State<RegistroPalpite> createState() => _registroPalpiteState();
}

class _registroPalpiteState extends State<RegistroPalpite> {
  final TextEditingController _placarMandanteController = TextEditingController();
  final TextEditingController _placarVisitanteController = TextEditingController();
  bool _palpiteGravado = false;
  Palpite? _palpite;
  String? _mensagemResultado;
  late AppDatabase database;

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
    _carregarPalpite();
  }

  Future<void> _carregarPalpite() async {
    final palpite = await (database
        .select(database.palpites)
        ..where((tabela) => tabela.partidaId.equals(widget.partidaId)))
        .getSingleOrNull();

    if (palpite != null) {
      setState(() {
        _palpiteGravado = true;
        _palpite = palpite;
      });
    }

    await _verificarResultadoAoCarregar();
  }

  Future<void> _gravarPalpite() async {

    final partida = await (database
        .select(database.partidas)
      ..where((tabela) => tabela.partida_id.equals(widget.partidaId)))
        .getSingleOrNull();

    if (partida == null) return;

    final DateTime horarioAtual = DateTime.now();
    DateTime dataPartida;
    DateTime horarioPartida;


    try {
      dataPartida = DateTime.parse(partida.data_realizacao);
      horarioPartida = DateTime.parse(partida.hora_realizacao);
    } catch (e) {
      // Caso os dados estejam em formatos separados ou sejam parciais
      final List<String> dataPartes = partida.data_realizacao.split('-');
      final List<String> horaPartes = partida.hora_realizacao.split(':');
      dataPartida = DateTime(
        int.parse(dataPartes[0]), // Ano
        int.parse(dataPartes[1]), // Mês
        int.parse(dataPartes[2]), // Dia
      );
      horarioPartida = DateTime(
        dataPartida.year,
        dataPartida.month,
        dataPartida.day,
        int.parse(horaPartes[0]), // Hora
        int.parse(horaPartes[1]), // Minuto
      );
    }

    if (horarioAtual.isAfter(horarioPartida)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('A partida já foi iniciada. Não é possível registrar palpites.'),
        ),
      );
      return;
    }

    final placarMandantePalpite = int.tryParse(_placarMandanteController.text);
    final placarVisitantePalpite = int.tryParse(_placarVisitanteController.text);

    if (placarMandantePalpite == null || placarVisitantePalpite == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, insira um placar válido.')),
      );
      return;
    }

    await database.into(database.palpites).insert(
      PalpitesCompanion(
        partidaId: drift.Value(widget.partidaId),
        placarMandantePalpite: drift.Value(placarMandantePalpite),
        placarVisitantePalpite: drift.Value(placarVisitantePalpite),
      ),
    );

    setState(() {
      _palpiteGravado = true;
      _palpite = Palpite(
        palpite_id: 0,
        partidaId: widget.partidaId,
        placarMandantePalpite: placarMandantePalpite,
        placarVisitantePalpite: placarVisitantePalpite,
      );
    });

    await _verificarResultadoAoCarregar();
  }



  Future<void> _verificarResultadoAoCarregar() async {
    if (!_palpiteGravado) return;

    final partida = await (database
        .select(database.partidas)
      ..where((tabela) => tabela.partida_id.equals(widget.partidaId)))
        .getSingleOrNull();

    if (partida == null || _palpite == null) return;

    final DateTime horarioAtual = DateTime.now();
    DateTime dataPartida;
    DateTime horarioPartida;


    try {
      dataPartida = DateTime.parse(partida.data_realizacao);
      horarioPartida = DateTime.parse(partida.hora_realizacao);
    } catch (e) {
      // Caso os dados estejam em formatos separados ou sejam parciais
      final List<String> dataPartes = partida.data_realizacao.split('-');
      final List<String> horaPartes = partida.hora_realizacao.split(':');
      dataPartida = DateTime(
        int.parse(dataPartes[0]), // Ano
        int.parse(dataPartes[1]), // Mês
        int.parse(dataPartes[2]), // Dia
      );
      horarioPartida = DateTime(
        dataPartida.year,
        dataPartida.month,
        dataPartida.day,
        int.parse(horaPartes[0]), // Hora
        int.parse(horaPartes[1]), // Minuto
      );
    }

    if (horarioAtual.isBefore(horarioPartida.add(const Duration(hours: 2)))) {
      setState(() {
        _mensagemResultado = 'Resultado ainda indisponível. Volte após o término da partida.';
      });
      return;
    }

    final acertouPlacar = _palpite!.placarMandantePalpite == partida.placar_mandante
        && _palpite!.placarVisitantePalpite == partida.placar_visitante;

    final acertouResultado = (
        _palpite!.placarMandantePalpite > _palpite!.placarVisitantePalpite
        && partida.placar_mandante > partida.placar_visitante) ||
         (_palpite!.placarMandantePalpite < _palpite!.placarVisitantePalpite
             && partida.placar_mandante < partida.placar_visitante) ||
         (_palpite!.placarMandantePalpite == _palpite!.placarVisitantePalpite
             && partida.placar_mandante == partida.placar_visitante);

    setState(() {
      if (acertouPlacar) {
        _mensagemResultado =
        '🎉 Parabéns! Você acertou o placar exato da partida!';
      } else if (acertouResultado) {
        _mensagemResultado =
        '😊 Você acertou o resultado, mas não o placar exato.';
      } else {
        _mensagemResultado =
        '😢 Infelizmente, você não acertou o resultado desta vez.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Palpite'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Partida: ${widget.timeMandantePalpite} x ${widget.timeVisitantePalpite}',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              if (_palpiteGravado) ...[
                  Text(
                    'Palpite já registrado:',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text('Placar ${widget.timeMandantePalpite}: ${_palpite!.placarMandantePalpite}'),
                  Text('Placar ${widget.timeVisitantePalpite}: ${_palpite!.placarVisitantePalpite}'),
                  if (_mensagemResultado != null) ...[
                    const SizedBox(height: 16),
                    Text(
                    _mensagemResultado!,
                    style: const TextStyle(fontSize: 16, color: Colors.blue),
                    textAlign: TextAlign.center,
                    ),
                  ],
                ] else ...[
                  TextField(
                    controller: _placarMandanteController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Placar ${widget.timeMandantePalpite}',
                    ),
                  ),
                  TextField(
                    controller: _placarVisitanteController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Placar ${widget.timeVisitantePalpite}',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _gravarPalpite,
                  child: const Text('Gravar Palpite'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
