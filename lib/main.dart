import 'package:flutter/material.dart';
import 'package:loja_oline_gerenciamento/screens/login/login.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home:  LoginScreen(),);
  }
}