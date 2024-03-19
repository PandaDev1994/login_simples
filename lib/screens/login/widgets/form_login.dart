import 'package:flutter/material.dart';
import 'package:loja_oline_gerenciamento/screens/login/widgets/row_with_icon_text_form_field.dart';

class FormLogin extends StatelessWidget {
  final TextEditingController controllerUser;
  final TextEditingController controllerPass;
  const FormLogin({
    super.key,
    required this.form,
    required this.controllerUser,
    required this.controllerPass,
  });

  final GlobalKey<FormState> form;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          RowWithIconAndTextFormField(
            icon: Icons.person,
            hint: 'Usuário',
            back: 'Informe o usuario',
            isObscure: false,
            controller: controllerUser,
          ),
          const SizedBox(
            height: 25,
          ),
          RowWithIconAndTextFormField(
            icon: Icons.password,
            hint: 'Senha',
            back: 'Informe sua senha',
            isObscure: true,
            controller: controllerPass,
          ),
        ],
      ),
    );
  }
}
