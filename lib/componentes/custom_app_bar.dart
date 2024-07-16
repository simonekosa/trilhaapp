import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Customappbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const Customappbar({super.key, required this.title});

  @override
  State<Customappbar> createState() => _CustomappbarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _CustomappbarState extends State<Customappbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
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
    );
  }
}
