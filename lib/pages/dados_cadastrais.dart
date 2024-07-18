import 'package:flutter/material.dart';
import 'package:trilhaapp/componentes/custom_app_bar.dart';
import 'package:trilhaapp/model/dados_cadastrais_model.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/repositories/sqlite/dados_cadastrais_repository.dart';
import '../repositories/objetivo.dart';
import '../componentes/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  DadosSQLiteRepository dadosSQLiteRepository = DadosSQLiteRepository();
  // Declaração dos controladores de texto e variáveis necessárias
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController dataNascimentoController =
      TextEditingController();
  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelecionado = "";
  var objetivoRepository = ObjetivoRepository();
  var objetivos = [];
  var objetivoSelecionado = [];
  var alturaSelecionada = 0;
  DateTime? dataNascimento;

  @override
  void initState() {
    super.initState();
    niveis = nivelRepository.retornaNiveis();
    objetivos = objetivoRepository.retornaObjetivo();
  }

  @override
  void dispose() {
    // Certifique-se de liberar os controladores de texto ao descartar o widget
    nomeController.dispose();
    pesoController.dispose();
    dataNascimentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Dados Cadastrais"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListView(
          children: [
            const TextLabel(texto: "Nome"),
            TextField(
              controller: nomeController,
            ),
            const TextLabel(texto: "Informe seu peso atual"),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
            ),
            const TextLabel(texto: "Data de Nascimento"),
            TextField(
              controller: dataNascimentoController,
              readOnly: true,
              onTap: () async {
                var data = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1960, 1, 1),
                    lastDate: DateTime(2030, 1, 1));
                if (data != null) {
                  dataNascimentoController.text = data.toIso8601String();
                  dataNascimento = data;
                }
              },
            ),
            const TextLabel(texto: "Nivel de Atividade:"),
            Column(
              children: niveis
                  .map((nivel) => RadioListTile(
                      dense: true,
                      activeColor: Colors.pink,
                      title: Text(nivel.toString()),
                      selected: nivelSelecionado == nivel,
                      value: nivel.toString(),
                      groupValue: nivelSelecionado,
                      onChanged: (value) {
                        setState(() {
                          nivelSelecionado = value.toString();
                        });
                      }))
                  .toList(),
            ),
            const TextLabel(texto: "Selecione um ou mais Objetivos"),
            Column(
              children: objetivos
                  .map((e) => CheckboxListTile(
                      dense: true,
                      activeColor: Colors.pink,
                      title: Text(e),
                      selected: objetivoSelecionado.contains(e),
                      value: objetivoSelecionado.contains(e),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value!) {
                            objetivoSelecionado.add(e);
                          } else {
                            objetivoSelecionado.remove(e);
                          }
                        });
                      }))
                  .toList(),
            ),
            const TextLabel(texto: "Selecione a Altura em Centimetros"),
            Slider(
                thumbColor: Colors.pink,
                activeColor: Colors.pink,
                min: 0,
                max: 250,
                divisions: 250,
                label: alturaSelecionada.round().toString(),
                value: alturaSelecionada.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    alturaSelecionada = value.round();
                  });
                }),
            TextButton(
              onPressed: () async {
                if (nomeController.text.trim().length < 2) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Favor informar um nome!",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                    backgroundColor: Colors.pink,
                    shape: StadiumBorder(),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(50),
                    elevation: 30,
                  ));
                  return;
                }
                if (dataNascimento == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Favor informar uma data de nascimento!",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                    backgroundColor: Colors.pink,
                    shape: StadiumBorder(),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(50),
                    elevation: 30,
                  ));
                  return;
                }
                if (pesoController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Favor informar um peso!",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                    backgroundColor: Colors.pink,
                    shape: StadiumBorder(),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(50),
                    elevation: 30,
                  ));
                  return;
                }
                if (nivelSelecionado.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Favor informar um nivel de atividade!",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                    backgroundColor: Colors.pink,
                    shape: StadiumBorder(),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(50),
                    elevation: 30,
                  ));
                  return;
                }
                if (objetivoSelecionado.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Favor informar pelo menos 1 objetivo!",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                    backgroundColor: Colors.pink,
                    shape: StadiumBorder(),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(50),
                    elevation: 30,
                  ));
                  return;
                }
                if (alturaSelecionada == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Favor informar sua altura!",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                    backgroundColor: Colors.pink,
                    shape: StadiumBorder(),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(50),
                    elevation: 30,
                  ));
                  return;
                } else {
                  await dadosSQLiteRepository.salvar(DadosCadastraisModel(
                    id: 0,
                    nome: nomeController.text,
                    peso: int.parse(pesoController.text),
                    dataNascimento:
                        DateTime.parse(dataNascimentoController.text),
                    nivelAividade: nivelSelecionado,
                    objetivos: objetivoSelecionado.join(", "),
                    altura: alturaSelecionada,
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Salvo com sucesso!",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                      backgroundColor: Colors.pink,
                      duration: Duration(seconds: 2),
                    ),
                  );
                  await Future.delayed(const Duration(seconds: 2));
                  Navigator.pop(context);
                }
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
