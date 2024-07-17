import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/componentes/custom_app_bar.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text( "Home",          
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
      drawer: const Drawer(        
        child: Column(          
          
        ),
      ),    
    );
  }
}