import 'package:flutter/material.dart';
import 'package:vibeplay/screens/login_screen.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer que espera 7 segundos antes de navegar
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: 300, // Largura desejada da imagem
          height: 300, // Altura desejada da imagem
          child: Image.asset('assets/image/logoVipePlay.png'),
        ),
      ),
    );
  }
}
