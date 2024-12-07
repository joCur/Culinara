import 'package:flutter/material.dart';

class ReflectionTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final int? maxLines;

  const ReflectionTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
