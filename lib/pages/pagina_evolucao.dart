import 'package:flutter/material.dart';
import 'package:trilhaapp/componentes/custom_app_bar.dart';
import 'package:trilhaapp/repositories/sqlite/dados_cadastrais_repository.dart';
import '../classes/calcular_imc.dart';
import '../classes/imc_resultado.dart';
import '../classes/pessoa.dart';

class PaginaEvolucao extends StatefulWidget {
  const PaginaEvolucao({super.key});

  @override
  _PaginaEvolucaoState createState() => _PaginaEvolucaoState();
}

class _PaginaEvolucaoState extends State<PaginaEvolucao> {
  DadosSQLiteRepository dadosSQLiteRepository = DadosSQLiteRepository();
  List<Map<String, dynamic>> _evolucao = [];

  @override
  void initState() {
    super.initState();
    _obterEvolucao();
  }

  Future<void> _obterEvolucao() async {
    List<Map<String, dynamic>> evolucao =
        await dadosSQLiteRepository.obterEvolucao();
    setState(() {
      _evolucao = evolucao;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Lista de Resultados"),
      body: ListView.builder(
        itemCount: _evolucao.length,
        itemBuilder: (context, index) {
          int peso = _evolucao[index]['pesoAtualizado'];
          int altura = _evolucao[index]['altura'];
          String nome = _evolucao[index]['nome'];
          Pessoa pessoa = Pessoa(nome: nome, peso: peso, altura: altura);
          ResultadoIMC resultadoIMC = CalcularIMC(pessoa: pessoa).calcular();

          return ListTile(
            title: Text(nome),
            subtitle: Text(resultadoIMC.message),
            leading: Icon(resultadoIMC.icon),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _adicionarPeso(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _adicionarPeso(BuildContext context) {
    final TextEditingController pesoController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Peso Atualizado'),
          content: TextField(
            controller: pesoController,
            decoration: const InputDecoration(labelText: 'Peso Atualizado'),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                if (pesoController.text.isNotEmpty) {
                  int pesoAtualizado = int.parse(pesoController.text);
                  // Salvar o peso atualizado no banco de dados
                  await dadosSQLiteRepository.salvarPesoAtualizado(1,
                      pesoAtualizado); // Substitua '1' pelo ID real da pessoa
                  _obterEvolucao();
                  Navigator.pop(context);
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
