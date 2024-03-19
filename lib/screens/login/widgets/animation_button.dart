import 'package:flutter/material.dart';

class AnimationButton extends StatelessWidget {
  final GlobalKey<FormState> form;
  final AnimationController controller;
  AnimationButton({super.key, required this.controller, required this.form})
      // fazemos as iniciações de nossas animações
      : buttonSqueeze = Tween(begin: 360.0, end: 50.0).animate(CurvedAnimation(
            parent: controller, curve: const Interval(0.0, 0.150))),
        buttonZoomOut = Tween(begin: 60.0, end: 1000.0).animate(CurvedAnimation(
            parent: controller, curve: const Interval(0.5, 1.0)));
  // declaramos as animalções do tipo double para podermos animar
  // noss botão e conainer
  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  Widget _build(BuildContext context, Widget? child) {
    return InkWell(
        onTap: () {
          // validação para verificar se foi digitado ou não alguma coisa
          // nos campos de digitação do form
          if (form.currentState!.validate()) {
            form.currentState!.reset();
            controller.forward();
          }
        },
        // usamos o hero para futuramente poder animar uma segunda pagina
        // para mais informações olhar a documentação do Hero
        child: Hero(
          tag: 'button',
          child: buttonZoomOut.value < 80.0
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: buttonSqueeze.value < 75
                          ? BorderRadius.circular(50)
                          : BorderRadius.circular(0)),
                  alignment: Alignment.center,
                  width: buttonSqueeze.value,
                  height: 50.0,
                  child: buttonSqueeze.value > 75
                      ? const Text(
                          'Entrar',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      : const CircularProgressIndicator(),
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      shape: buttonZoomOut.value < 500
                          ? BoxShape.circle
                          : BoxShape.rectangle),
                  alignment: Alignment.center,
                  width: buttonZoomOut.value,
                  height: buttonZoomOut.value,
                ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _build);
  }
}
