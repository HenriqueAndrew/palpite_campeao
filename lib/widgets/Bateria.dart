import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bateria extends StatefulWidget {  
  const Bateria({Key? key}) : super(key: key);

  @override
  _BateriaState createState() => _BateriaState();
}

class _BateriaState extends State<Bateria> {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  String _batteryLevel = 'Nível de bateria desconhecido.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Nível da bateria em $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Falha ao obter nível da bateria: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('Obter nível de bateria'),
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
// Get battery level.
}