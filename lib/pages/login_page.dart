import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 218, 237),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 4,
                      child: Image.asset(
                        'lib/images/logo_login.png',
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const Text(
                  'Ja tem Cadastro?',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.pink),
                ),
                const Text(
                  'Faça seu login',
                  style: TextStyle(fontSize: 16, color: Colors.pinkAccent),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: const TextField(
                    style: TextStyle(color: Colors.pinkAccent),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pinkAccent)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pinkAccent)),
                        prefixIcon: Icon(Icons.email, color: Colors.pink),
                        hintText: "Email",
                        hintStyle:
                            TextStyle(color: Colors.pinkAccent, fontSize: 14)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: const TextField(
                    style: TextStyle(color: Colors.pinkAccent),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      prefixIcon: Icon(Icons.lock, color: Colors.pink),
                      hintText: "Senha",
                      hintStyle:
                          TextStyle(color: Colors.pinkAccent, fontSize: 14),
                      suffixIcon: Icon(Icons.visibility, color: Colors.pink),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.pinkAccent)),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.pink, fontWeight: FontWeight.w200),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text(
                    'Cadastre-se',
                    style: TextStyle(
                        color: Colors.pink, fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
