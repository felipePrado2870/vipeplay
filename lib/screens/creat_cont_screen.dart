import 'package:flutter/material.dart';
import 'package:vibeplay/screens/home_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  bool isNameValid = false;
  bool isPhoneValid = false;
  bool isEmailValid = false;
  bool showPhoneField = false;
  bool showEmailField = false;
  bool showPasswordField = false;

  void validateFields() {
    // Valida os campos e controla a visibilidade de cada campo subsequente
    if (formKey.currentState != null) {
      bool nameValid = formKey.currentState!.validate();
      setState(() {
        isNameValid = nameValid;
        showPhoneField = isNameValid; // Mostra telefone após nome válido
        if (!showPhoneField) {
          showEmailField = false;
          showPasswordField = false;
        }
      });
    }
  }

  void validatePhone() {
    if (formKey.currentState != null) {
      bool phoneValid = formKey.currentState!.validate();
      setState(() {
        isPhoneValid = phoneValid;
        showEmailField = isPhoneValid; // Mostra email após telefone válido
        if (!showEmailField) {
          showPasswordField = false;
        }
      });
    }
  }

  void validateEmail() {
    if (formKey.currentState != null) {
      bool emailValid = formKey.currentState!.validate();
      setState(() {
        isEmailValid = emailValid;
        showPasswordField = isEmailValid; // Mostra senha após email válido
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Crie sua conta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 80),

                    // Campo de Nome
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Nome Completo',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onChanged: (value) {
                        validateFields();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu nome completo';
                        } 
                        else if (!RegExp(r'(^[a-zA-Z ]*$)').hasMatch(value)) {
                          return "O nome deve conter apenas caracteres de a-z ou A-Z";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Campo de Telefone, aparece após nome válido
                    if (showPhoneField)
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'DDD + Telefone',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onChanged: (value) {
                          validatePhone();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu telefone';
                          }
                          else if  (value.length < 11) {
                            return 'Numero Telefone muito curto, insira um Numero válido';
                          }
                          else if  (!RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(value)) {
                            return 'Por favor, insira um telefone válido';
                          }
                          return null;
                        },
                      ),
                    const SizedBox(height: 10),

                    // Campo de Email, aparece após telefone válido
                    if (showEmailField)
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onChanged: (value) {
                          validateEmail();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          }
                          else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Por favor, insira um email válido';
                          }
                          return null;
                        },
                      ),
                    const SizedBox(height: 10),

                    // Campo de Senha, aparece após email válido
                    if (showPasswordField)
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          if (value.length < 6) {
                            return 'Senha muito curta, insira uma senha válida';
                          }
                          return null;
                        },
                      ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Lógica de cadastro
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white10,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ), 
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Já tem uma conta? Faça login',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
