import 'package:flutter/material.dart';
import 'package:trilhaapp/componentes/custom_app_bar.dart';

class dadosCadastrais extends StatefulWidget {
  const dadosCadastrais({super.key});

  @override
  State<dadosCadastrais> createState() => _dadosCadastraisState();
}

class _dadosCadastraisState extends State<dadosCadastrais> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Customappbar(title: "Dados Cadastrais"),
    );
  }
}