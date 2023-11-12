import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/models/models.dart';
import 'package:phone_book/presentation/edit_screen/edit_employee_screen.dart';
import 'package:phone_book/presentation/edit_screen/phone_item.dart';
import 'package:phone_book/services/drift_service.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployeeItem extends StatelessWidget {
  final Employee employee;
  const EmployeeItem(this.employee, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(employee.firstName),
        subtitle: Text('${employee.name} ${employee.lastName}'),
        trailing: IconButton(
          icon: Icon(
            Icons.call,
            color: Colors.green,
          ),
          onPressed: () async {
            List<Phone> phones = await DriftService().selectPhones(employee.id);
            if (phones.length > 1) {
              showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  title: Text(
                    'Выберите телефон',
                    textAlign: TextAlign.center,
                  ),
                  contentPadding: EdgeInsets.all(16),
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
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => EmployeeEditScreen(employee)));
      },
    );
  }
}
