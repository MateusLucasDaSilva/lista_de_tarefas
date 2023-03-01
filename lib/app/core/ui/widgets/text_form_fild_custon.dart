// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFormFildCuston extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String label;

  const TextFormFildCuston({
    Key? key,
    this.controller,
    required this.label,
     this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      maxLines: null,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo não preenchido';
        }
        return null;
      },
    );
  }
}
