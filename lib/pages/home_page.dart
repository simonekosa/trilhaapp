import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/componentes/custom_app_bar.dart';
import '../service/gerar_numero_aleatorio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;
  var quantidadedeCliques = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Customappbar(title: 'Trilha app Flutter'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 250.0, horizontal: 20.0),
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
            color: const Color.fromARGB(88, 250, 1, 84),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ações do Usuário do Usuário",
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
              Text(
                "Foi clicado $quantidadedeCliques vezes",
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
              Text(
                "O numero gerado foi: $numeroGerado",
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            quantidadedeCliques = quantidadedeCliques + 1;
            numeroGerado =
                GeradorNumeroAleatorioService.gerarNumeroAleatorio(1000);
          });
        },
        icon: const Icon(Icons.ads_click),
        label: const Text('Clique'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
    );
  }
}
