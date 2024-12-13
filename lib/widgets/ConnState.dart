import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:palpite_campeao/widgets/StatusConexao.dart';

class ConnState extends StatefulWidget {
  const ConnState({Key? key, this.callback}) : super(key: key);

  final Function(StatusConexao status)? callback;

  @override
  State<ConnState> createState() => _ConnState();
}

class _ConnState extends State<ConnState> {
  final Connectivity _connectivity = Connectivity();
  StatusConexao _statusConexao = StatusConexao.checking;

  @override
  void initState() {
    super.initState();
    verificarConexao();
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results){
      if (results.contains(ConnectivityResult.none)){
        _atualizarStatus(ConnectivityResult.none);
      } else{
        _atualizarStatus(results.first);
      }
    });
  }

  Future <void> verificarConexao() async {
    try{
    final List<ConnectivityResult> results = await _connectivity.checkConnectivity();
    if (results.contains(ConnectivityResult.none)){
      _atualizarStatus(ConnectivityResult.none);
    } else{
      _atualizarStatus(results.first);
    }
  }catch (e){
      setState(() {
        _statusConexao = StatusConexao.offline;
      });
    }
  }

  void _atualizarStatus(ConnectivityResult result){
    setState(() {
      if (result == ConnectivityResult.none) {
        _statusConexao = StatusConexao.offline;
      } else {
        _statusConexao = StatusConexao.online;
      }
    });

    widget.callback?.call(_statusConexao);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      switch (_statusConexao) {
        StatusConexao.checking => 'Verificando conexão com o Servidor...',
        StatusConexao.offline => 'Offline',
        StatusConexao.online => 'Online',
      },
      style: TextStyle(
        color: _statusConexao == StatusConexao.online ? Colors.green : Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}