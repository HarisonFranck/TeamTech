import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final List<TextInputFormatter> inputFormatter;
  final InputDecoration inputDecoration;
  final TextInputType textInputType;
  final FocusNode focusNode;
  final FormFieldValidator formFieldValidator;

  const MyTextField(
      {super.key, required this.controller,
      required this.inputFormatter,
      required this.inputDecoration,
      required this.formFieldValidator,
      required this.focusNode,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatter,
      validator: formFieldValidator,
      decoration: inputDecoration,
      focusNode: focusNode,
    );
  }
}
