import 'package:flutter/material.dart';

import '../componentes/custom_app_bar.dart';

class CalcularImcPage extends StatefulWidget {
  const CalcularImcPage({super.key});

  @override
  State<CalcularImcPage> createState() => _CalcularImcPageState();
}

class _CalcularImcPageState extends State<CalcularImcPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: "Calcular Imc"),
      body: Container(
        color: const Color.fromARGB(255, 245, 119, 161),
      ),
    );
  }
}
