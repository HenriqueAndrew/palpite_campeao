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
  State<RegistroPalpite> createState() => _PalpiteState();
}

class _PalpiteState extends State<RegistroPalpite> {
  final _placarMandanteController = TextEditingController();
  final _placarVisitanteController = TextEditingController();
  bool _palpiteGravado = false;
  Palpite? _palpite;
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
  }

  Future<void> _gravarPalpite() async {
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

    _exibirMensagemResultado(placarMandantePalpite, placarVisitantePalpite);
  }

  Future<void> _exibirMensagemResultado(int placarMandantePalpite, int placarVisitantePalpite) async {
    final partida = await (database
        .select(database.partidas)
        ..where((tabela) => tabela.partida_id.equals(widget.partidaId))).getSingleOrNull();

    if (partida == null) return;

    final acertouPlacar = placarMandantePalpite == partida.placar_mandante &&
        placarVisitantePalpite == partida.placar_visitante;

    final acertouResultado = (placarMandantePalpite > placarVisitantePalpite &&
        partida.placar_mandante > partida.placar_visitante) ||
        (placarMandantePalpite < placarVisitantePalpite &&
            partida.placar_mandante < partida.placar_visitante) ||
        (placarMandantePalpite == placarVisitantePalpite &&
            partida.placar_mandante == partida.placar_visitante);

    String mensagem;
    if (acertouPlacar) {
      mensagem =
      'Parabéns, você acertou o resultado em cheio!';
    } else if (acertouResultado) {
      mensagem =
      'Você foi bem, não acertou o placar, mas acertou quem ganhou ou o empate.';
    } else {
      mensagem =
      'Que pena, não foi desta vez. Quem sabe na próxima tentativa!';
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensagem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Palpite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Partida: ${widget.timeMandantePalpite} x ${widget.timeVisitantePalpite}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            if (_palpiteGravado)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Palpite já registrado:',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text('Placar ${widget.timeMandantePalpite}: ${_palpite!.placarMandantePalpite}'),
                  Text('Placar ${widget.timeVisitantePalpite}: ${_palpite!.placarVisitantePalpite}'),
                ],
              )
            else ...[
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
    );
  }
}
