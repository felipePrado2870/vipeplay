import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: 300, // Largura desejada da imagem
          height: 300, // Altura desejada da imagem
          child: Image.asset('assets/icon/son.png'),
        ),
      ),
    );
  }
}