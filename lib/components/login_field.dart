import 'package:flutter/material.dart';

import 'global.dart';


class LoginField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final  TextEditingController controller;
  final TextInputType textInputType;
  final bool obscure;
  final bool enabled;
  const LoginField({super.key, required this.hintText,required this.controller, required this.textInputType, required this.obscure, required this.labelText, required this.enabled});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return "Field is required";
          }
        },
        keyboardType: textInputType,
        controller: controller,
        obscureText: obscure,
        enabled: enabled,
        decoration: InputDecoration(
          //contentPadding: EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Global.borderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(6)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.orange,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(6)
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          hintText: hintText,
          labelText: labelText,
          //labelText: 'label'
        ),
      ),
    );
  }
}
