import 'package:flutter/material.dart';

import '../componentes/custom_app_bar.dart';

class PaginaEvolucao extends StatefulWidget {
  const PaginaEvolucao({super.key});

  @override
  State<PaginaEvolucao> createState() => _PaginaEvolucaoState();
}

class _PaginaEvolucaoState extends State<PaginaEvolucao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: "Listar Evolucao"),
      body: Container(
        color: const Color.fromARGB(255, 245, 119, 161),
      ),
    );
  }
}
