import 'package:flutter/material.dart';
import 'package:palpite_campeao/RegistroPalpite.dart';
import 'package:palpite_campeao/widgets/ConnState.dart';
import 'package:palpite_campeao/widgets/Offline.dart';
import 'package:palpite_campeao/widgets/Online.dart';
import 'package:palpite_campeao/widgets/StatusConexao.dart';

const desafioRoute = "/home";
const palpiteRoute = "/palpite";
const consultarPalpiteRoute = "/consultarPalpite";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Palpite Campeão',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal), //deepPurple
        useMaterial3: true,
      ),
      initialRoute: desafioRoute,
      routes: {
        desafioRoute: (context) => const Desafio(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == palpiteRoute) {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => RegistroPalpite(
              partidaId: args['partidaId'],
              timeMandantePalpite: args['timeMandantePalpite'],
              timeVisitantePalpite: args['timeVisitantePalpite'],
            ),
          );
        }
        return null;
      },
    );
  }
}

class Desafio extends StatefulWidget {
  const Desafio({super.key});

  @override
  State<Desafio> createState() => _DesafioState();
}

class _DesafioState extends State<Desafio> {
  StatusConexao _statusConexao = StatusConexao.checking;

  void btPalpite() {
    Navigator.pushNamed(
      context,
      palpiteRoute,
      arguments: {
        'partidaId': 1, // Exemplo de ID da partida
        'timeMandantePalpite': 'Flamengo',
        'timeVisitantePalpite': 'Palmeiras',
      },
    );
  }

  void btConsultarPalpite(){
    Navigator.pushNamed(
      context,
      consultarPalpiteRoute,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Palpite Campeão"),
          actions: [
                ConnState(
                  callback: (status){
                    setState(() {
                      _statusConexao = status;
                    });
                  },
                ),
            const SizedBox(width: 16),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _getCurrentWidget()),
              const SizedBox(height: 20),
              OutlinedButton(
                  onPressed: btPalpite,
                  child: const Text("Registrar Palpite")
              ),
              OutlinedButton(
                  onPressed: btConsultarPalpite,
                  child: const Text("Consultar Palpite")
              )
            ],
          ),
        ),
    );
  }

  Widget _getCurrentWidget() {
    switch (_statusConexao) {
      case StatusConexao.checking:
        return const Center (child: CircularProgressIndicator());
      case StatusConexao.offline:
        return const Offline();
      case StatusConexao.online:
        return const Online();
      default:
        return const Center(child: Text("Estado desconhecido"));
    }
  }
}
