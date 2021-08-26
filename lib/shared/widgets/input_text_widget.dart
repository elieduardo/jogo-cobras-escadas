import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final void Function(String value)? onChanged;

  const InputTextWidget({
    Key? key,
    required this.label,
    this.validator,
    this.controller,
    this.textInputAction,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 15),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
        ),
        onChanged: onChanged ?? null,
        validator: validator,
        textInputAction: textInputAction ?? TextInputAction.done,
        controller: controller,
      ),
    );
  }
}
