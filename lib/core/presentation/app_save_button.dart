import 'package:flutter/material.dart';

class AppSaveButton extends StatelessWidget {
  final VoidCallback? onTap;
  const AppSaveButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(18),
          textStyle: const TextStyle(fontSize: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      onPressed: onTap,
      child: const Text('Сохранить'),
    );
  }
}
