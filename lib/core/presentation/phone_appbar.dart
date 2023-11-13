import 'package:flutter/material.dart';

class PhoneAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backAction;
  const PhoneAppBar({required this.title, this.backAction = true, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: backAction
          ? GestureDetector(
              child: const Icon(
                Icons.chevron_left_outlined,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          : null,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
