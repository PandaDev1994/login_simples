import 'package:flutter/material.dart';
import 'package:loja_oline_gerenciamento/screens/login/widgets/animation_button.dart';
import 'package:loja_oline_gerenciamento/screens/login/widgets/form_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final form = GlobalKey<FormState>();

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        // aqui será colocado o que irá acontecer pós animação
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

// aqui declaramoes nossos editingControllers
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  const Center(
                    child: Icon(
                      Icons.store,
                      size: 150,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  // fazemos a criação do formLogin de forma separada
                  // para que fique facíl a manutenção futuramente
                  FormLogin(
                    form: form,
                    controllerUser: userController,
                    controllerPass: passController,
                  ),
                  const SizedBox(
                    height: 85,
                  ),
                ],
              ),
              //fazemos a criação do botão animado de forma separada
              // para que fique facíl a manutenção futuramente
              AnimationButton(
                  controller: animationController.view as AnimationController,
                  form: form),
            ],
          ),
        ],
      ),
    );
  }
}
