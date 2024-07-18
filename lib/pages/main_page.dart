import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../componentes/custom_drawer.dart';

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
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
                width: double.infinity,
                child: Card(
                  elevation: 8,
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Importancia do calculo de Imc",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            height: 8), // Espaçamento entre o texto e a imagem
                        Image.network(
                          "https://www.plasticadosonho.com.br/wp-content/uploads/2017/12/blog-06-como-calcular-o-imc.jpg",
                          height:
                              150, // Você pode ajustar a altura da imagem conforme necessário
                          width: double.infinity,
                          fit: BoxFit
                              .cover, // Ajusta a imagem para cobrir o espaço disponível
                        ),
                        const SizedBox(height: 8),
                        const Text(
                            "O cálculo do Índice de Massa Corporal (IMC) é crucial para avaliar a saúde de uma pessoa, pois ajuda a determinar se está dentro de uma faixa de peso saudável. Ele fornece uma estimativa da gordura corporal com base no peso e altura, sendo um indicador simples e acessível. O IMC é utilizado por profissionais de saúde para identificar riscos de doenças relacionadas ao sobrepeso, como diabetes e hipertensão. Além disso, serve como uma ferramenta inicial para recomendar mudanças no estilo de vida, dieta e exercícios físicos. Monitorar o IMC ao longo do tempo ajuda a manter um controle sobre a saúde geral e prevenir complicações futuras."),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text("Ler mais",
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.w700))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
