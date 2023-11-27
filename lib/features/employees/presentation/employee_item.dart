// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/core/models/models.dart';
import 'package:phone_book/core/repository/drift_repository.dart';
import 'package:phone_book/features/edit_employee/edit_employee_store.dart';
import 'package:phone_book/features/edit_employee/presentation/edit_employee_screen.dart';
import 'package:phone_book/core/presentation/phone_item.dart';
import 'package:phone_book/features/employees/employee_store.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployeeItem extends StatelessWidget {
  final Employee employee;
  const EmployeeItem(this.employee, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(employee.firstName),
        subtitle: Text('${employee.name} ${employee.lastName}'),
        trailing: IconButton(
          icon: const Icon(
            Icons.call,
            color: Colors.green,
          ),
          onPressed: () async {
            List<Phone> phones =
                await DriftRepository.shared.getPhones(employee.id);
            if (phones.length > 1) {
              showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  title: const Text(
                    'Выберите телефон',
                    textAlign: TextAlign.center,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  children: phones
                      .map((p) => PhoneItem(
                          phone: p,
                          onTap: () {
                            Navigator.maybePop(context);
                            launchUrl(Uri.parse('tel:${p.number}'));
                          }))
                      .toList(),
                ),
              );
            } else {
              launchUrl(Uri.parse('tel:${phones.first.number}'));
            }
          },
        ),
      ),
      onTap: () async {
        await EmployeeEditStore.shared.getData(employee);
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => EmployeeEditScreen(employee),
          ),
        ).then(
          (value) => EmployeeStore.shared.getEmployees(employee.organizationId),
        );
      },
    );
  }
}
