import 'package:flutter/material.dart';
import 'package:phone_book/core/models/models.dart';
import 'package:phone_book/features/edit_employee/edit_employee_store.dart';

class PhoneItem extends StatelessWidget {
  final Phone phone;
  final VoidCallback onTap;
  final bool deleteAction;
  const PhoneItem({
    super.key,
    required this.phone,
    this.deleteAction = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 72,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    phone.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    phone.number,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            deleteAction
                ? IconButton(
                    onPressed: () =>
                        EmployeeEditStore.shared.deletePhone(phone),
                    icon: const Icon(Icons.delete_outline),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
