import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/core/models/models.dart';
import 'package:phone_book/features/employees/presentation/employees_screen.dart';

class OrganizationItem extends StatelessWidget {
  final Organization organization;
  const OrganizationItem(this.organization, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.home),
      title: Text(organization.name),
      onTap: () async {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => EmployeesScreen(organization)));
      },
    );
  }
}
