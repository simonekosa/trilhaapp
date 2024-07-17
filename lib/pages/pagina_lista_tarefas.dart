import 'package:flutter/material.dart';

import '../componentes/custom_app_bar.dart';

class ListaTarefasPage extends StatefulWidget {
  const ListaTarefasPage({super.key});

  @override
  State<ListaTarefasPage> createState() => _ListaTarefasPageState();
}

class _ListaTarefasPageState extends State<ListaTarefasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: "Listar Tarefas"),
      body: Container(
        color: const Color.fromARGB(255, 247, 149, 182),
      ),
    );
  }
}
