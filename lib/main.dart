import 'package:flutter/material.dart';
import 'package:palpite_campeao/widgets/Bateria.dart';
import 'package:palpite_campeao/widgets/RegistroPalpite.dart';
import 'package:palpite_campeao/widgets/ConnState.dart';
import 'package:palpite_campeao/widgets/Offline.dart';
import 'package:palpite_campeao/widgets/Online.dart';
import 'package:palpite_campeao/widgets/StatusConexao.dart';

const homeRoute = "/home";
const palpiteRoute = "/palpite";
const bateriaRoute = "/bateria";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Palpite Campeão',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal), //deepPurple
        useMaterial3: true,
      ),
      initialRoute: homeRoute,
      routes: {
        homeRoute: (context) => const Home(),
        bateriaRoute: (context) => const Bateria()
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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _DesafioState();
}

class _DesafioState extends State<Home> {
  StatusConexao _statusConexao = StatusConexao.checking;

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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Consultar Bateria'),
                onTap: (){
                  Navigator.pushNamed(
                      context,
                      bateriaRoute);
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _getCurrentWidget()),
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
