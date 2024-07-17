import 'package:flutter/material.dart';

import '../componentes/custom_app_bar.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: "Configuracoes"),
      body: Container(
        color: const Color.fromARGB(255, 240, 186, 204),
      ),
    );
  }
}
