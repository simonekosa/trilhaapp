class DadosCadastraisModel {
  int id;
  String nome;
  int peso;
  DateTime dataNascimento;
  String nivelAividade;
  String objetivos;
  int altura;

  DadosCadastraisModel({
    required this.id,
    required this.nome,
    required this.peso,
    required this.dataNascimento,
    required this.nivelAividade,
    required this.objetivos,
    required this.altura,
  });

  int get getId => id;
  String get getNome => nome;
  int get getPeso => peso;
  DateTime get getDataNascimento => dataNascimento;
  String get getNivelAividade => nivelAividade;
  String get getObjetivos => objetivos;
  int get getAltura => altura;

  set setId(int id) {
    this.id = id;
  }

  set setNome(String nome) {
    this.nome = nome;
  }

  set setPeso(int peso) {
    this.peso = peso;
  }

  set setDataNascimento(DateTime dataNascimento) {
    this.dataNascimento = dataNascimento;
  }

  set setNivelAividade(String nivelAividade) {
    this.nivelAividade = nivelAividade;
  }

  set setObjetivos(String objetivos) {
    this.objetivos = objetivos;
  }

  set setAltura(int altura) {
    this.altura = altura;
  }
}
