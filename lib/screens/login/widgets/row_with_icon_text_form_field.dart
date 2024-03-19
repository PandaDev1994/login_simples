import 'package:flutter/material.dart';

class RowWithIconAndTextFormField extends StatelessWidget {
  final IconData icon;
  final String hint, back;
  final bool isObscure;
  final TextEditingController controller;
  const RowWithIconAndTextFormField(
      {super.key,
      required this.icon,
      required this.hint,
      required this.back,
      required this.isObscure,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextFormField(
            obscureText: isObscure,
            validator: (text) {
              if (text!.isEmpty && text == '') {
                return back;
              }
              return null;
            },
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.white),
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
}
