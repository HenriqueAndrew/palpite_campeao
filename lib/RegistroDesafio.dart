import 'package:flutter/material.dart';

class RegistroDesafio extends StatelessWidget {
  const RegistroDesafio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Palpite Campeão"),
        ),
        body: Center(
            child: Text("Teste")
        )
    );
  }
}
