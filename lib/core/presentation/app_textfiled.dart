import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextEditField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final bool autofocus;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool readOnly;
  final void Function(String?)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const AppTextEditField({
    this.controller,
    required this.labelText,
    this.keyboardType,
    this.readOnly = false,
    this.autofocus = false,
    this.validator,
    this.onFieldSubmitted,
    this.focusNode,
    this.inputFormatters,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        readOnly: readOnly,
        autofocus: autofocus,
        controller: controller,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onFieldSubmitted,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12)),
        ),
        keyboardType: keyboardType,
        validator: validator,
        inputFormatters: inputFormatters,
        textCapitalization: TextCapitalization.sentences,
      ),
    );
  }
}
