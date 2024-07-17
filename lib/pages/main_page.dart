import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/pages/configuracoes.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/pagina_evolucao.dart';
import 'package:trilhaapp/pages/pagina_lista_tarefas.dart';

import 'calcular_imc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Calculate Imc",
            style: GoogleFonts.pacifico(
              fontSize: 25,
              fontWeight: FontWeight.w300,
            ),
          ),
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          )),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const SizedBox(
                height: 200,
              ),
              const Divider(color: Colors.transparent),
              ListTile(
                leading: const Icon(Icons.home),
                iconColor: Colors.pink,
                title: const Text("Dados Cadastrais"),
                tileColor: const Color.fromARGB(14, 233, 30, 98),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DadosCadastraisPage()));
                },
              ),
              const Divider(color: Colors.transparent),
              ListTile(
                leading: const Icon(Icons.home),
                iconColor: Colors.pink,
                title: const Text("Calcular Imc"),
                tileColor: const Color.fromARGB(14, 233, 30, 98),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalcularImcPage()));
                },
              ),
              const Divider(color: Colors.transparent),
              ListTile(
                leading: const Icon(Icons.home),
                iconColor: Colors.pink,
                title: const Text("Listar Resultados"),
                tileColor: const Color.fromARGB(14, 233, 30, 98),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaginaEvolucao()));
                },
              ),
              const Divider(color: Colors.transparent),
              ListTile(
                leading: const Icon(Icons.home),
                iconColor: Colors.pink,
                title: const Text("Listar Tarefas"),
                tileColor: const Color.fromARGB(14, 233, 30, 98),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListaTarefasPage()));
                },
              ),
              const Divider(color: Colors.transparent),
              ListTile(
                leading: const Icon(Icons.home),
                iconColor: Colors.pink,
                title: const Text("Configurações"),
                tileColor: const Color.fromARGB(14, 233, 30, 98),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConfiguracoesPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
