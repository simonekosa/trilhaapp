import 'package:flutter/material.dart';
import 'package:trilhaapp/model/dados_cadastrais_model.dart';
import './database.dart';

class DadosSQLiteRepository {
  Future<List<DadosCadastraisModel>> obterTodos() async {
    List<DadosCadastraisModel> dados = [];
    var db = await SQLiteDatabase().obterDatabase();
    var result = await db.rawQuery(
        'SELECT id, nome, pesoAtual, dataNascimento, nivelAtividade, objetivos, altura FROM cadPessoa');

    for (var element in result) {
      dados.add(DadosCadastraisModel(
        id: int.parse(element["id"].toString()),
        nome: element["nome"].toString(),
        peso: int.parse(element["pesoAtual"].toString()),
        dataNascimento: DateTime.parse(element["dataNascimento"].toString()),
        nivelAividade: element["nivelAtividade"].toString(),
        objetivos: element["objetivos"].toString(),
        altura: int.parse(element["altura"].toString()),
      ));
    }
    return dados;
  }

  Future<void> salvar(DadosCadastraisModel dadoscadastraisModel) async {
    var db = await SQLiteDatabase().obterDatabase();
    await db.rawInsert(
        'INSERT INTO cadPessoa (nome, pesoAtual, dataNascimento, nivelAtividade, objetivos, altura) VALUES (?, ?, ?, ?, ?, ?)',
        [
          dadoscadastraisModel.nome,
          dadoscadastraisModel.peso,
          dadoscadastraisModel.dataNascimento.toIso8601String(),
          dadoscadastraisModel.nivelAividade,
          dadoscadastraisModel.objetivos,
          dadoscadastraisModel.altura,
        ]);
    debugPrint(dadoscadastraisModel.getNome);
  }

  Future<void> editar(DadosCadastraisModel dadoscadastraisModel) async {
    var db = await SQLiteDatabase().obterDatabase();
    await db.rawUpdate(
        'UPDATE cadPessoa SET nome=?, pesoAtual=?, dataNascimento=?, nivelAtividade=?, objetivos=?, altura=? WHERE id=?',
        [
          dadoscadastraisModel.nome,
          dadoscadastraisModel.peso,
          dadoscadastraisModel.dataNascimento.toIso8601String(),
          dadoscadastraisModel.nivelAividade,
          dadoscadastraisModel.objetivos,
          dadoscadastraisModel.altura,
          dadoscadastraisModel.id,
        ]);
  }

  Future<void> deletar(int id) async {
    var db = await SQLiteDatabase().obterDatabase();
    await db.rawDelete('DELETE FROM cadPessoa WHERE id=?', [id]);
  }

  Future<void> salvarPesoAtualizado(int idPessoa, int pesoAtualizado) async {
    var db = await SQLiteDatabase().obterDatabase();
    await db.rawInsert(
        'INSERT INTO pesoAtualizadoPessoa (idPessoa, pesoAtualizado) VALUES (?, ?)',
        [idPessoa, pesoAtualizado]);
  }

  Future<List<Map<String, dynamic>>> obterEvolucao() async {
    var db = await SQLiteDatabase().obterDatabase();
    var result = await db.rawQuery('''
      SELECT p.nome, pa.pesoAtualizado,p.altura
      FROM pesoAtualizadoPessoa pa
      INNER JOIN cadPessoa p ON pa.idPessoa = p.id
      ORDER BY pa.idPessoa
    ''');
    return result;
  }
}
