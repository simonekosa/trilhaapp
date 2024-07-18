import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/login_page.dart';
import '../pages/calcular_imc.dart';
import '../pages/configuracoes.dart';
import '../pages/dados_cadastrais.dart';
import '../pages/pagina_evolucao.dart';
import '../pages/pagina_lista_tarefas.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.pink),                                   
                  currentAccountPicture: CircleAvatar(                    
                      backgroundImage: AssetImage("lib/images/userimagem.jpg")),
                  accountName: Text("Simone Kosa"),
                  accountEmail: Text("simone_kosa@hotmail.com")),
              const SizedBox(
                height: 2,
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
              const Divider(color: Colors.transparent),
              ListTile(
                leading: const Icon(Icons.done_all),
                iconColor: Colors.pink,
                title: const Text("Termos de uso e privacidade"),
                tileColor: const Color.fromARGB(14, 233, 30, 98),
                onTap: () {
                  showModalBottomSheet(
                    context: context, 
                    builder: (BuildContext bc){
                        return SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                            child: const Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Termos de Uso e Política de Privacidade",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),                            
                                  Text("Ao utilizar nossos serviços, você concorda com os seguintes termos e condições. Coletamos informações pessoais, como nome, e-mail e dados de uso, para proporcionar  uma melhor experiência ao usuário. Seus dados são armazenados de forma segura e utilizados apenas para fins operacionais, aprimoramento dos nossos serviços e comunicação com você. Não compartilhamos suas informações com terceiros sem seu consentimento, exceto quando exigido por lei. Você tem o direito de acessar, corrigir ou solicitar a exclusão de seus dados pessoais a qualquer momento. Utilizamos cookies e tecnologias similares para melhorar a funcionalidade do nosso site e analisar o uso do serviço. Ao continuar a navegação, você aceita o uso dessas tecnologias. Reservamo-nos o direito de modificar estes termos a qualquer momento. Quaisquer alterações serão publicadas em nosso site e entrarão em vigor imediatamente. Recomendamos revisar periodicamente esta política para estar ciente de quaisquer mudanças. Se tiver dúvidas ou preocupações sobre nossa política de privacidade, entre em contato conosco.",textAlign: TextAlign.justify,),
                                ],
                              ),
                            ),                           
                          ),
                        );
                    }
                    );
                },
              ),
              const Divider(color: Colors.transparent),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                iconColor: Colors.pink,
                title: const Text("Sair"),
                tileColor: const Color.fromARGB(14, 233, 30, 98),
                onTap: () {
                 showDialog(
                  context: context, 
                  builder: (BuildContext bc) {
                    return  AlertDialog(
                      icon: const Icon(Icons.sentiment_dissatisfied,size: 45,color: Colors.white),
                      backgroundColor: Colors.pink,                      
                      title: const Text("Que Pena!",style: TextStyle(color: Colors.white)),
                      content: const Wrap(
                        children: [
                            Text("Tem certeza que deseja sair?",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,)),
                        ] 
                      ), 
                                      actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.pink, 
                    ),
                    child: const Text("Sim", style: TextStyle(color: Colors.white)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey, // Corrigido para definir a cor de fundo
                    ),
                    child: const Text("Não", style: TextStyle(color: Colors.white)),
                  ),
                ],
                                    );
                                  },
                                  );
                                },
                                
                              ),
                            ],
          ),
        );

  }
}