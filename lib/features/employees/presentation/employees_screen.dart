import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:phone_book/core/models/models.dart';
import 'package:phone_book/core/presentation/phone_appbar.dart';
import 'package:phone_book/features/employees/employee_store.dart';
import 'package:phone_book/features/employees/presentation/employee_item.dart';
import 'package:phone_book/features/organizations/organization_store.dart';

class EmployeesScreen extends StatefulWidget {
  final Organization organization;
  const EmployeesScreen(this.organization, {super.key});

  @override
  State<StatefulWidget> createState() => EmployeesScreenState();
}

class EmployeesScreenState extends State<EmployeesScreen> {
  @override
  void initState() {
    EmployeeStore.shared.getEmployees(widget.organization.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PhoneAppBar(
        title: widget.organization.name,
        actions: [
          IconButton(
            onPressed: () => _showDeleteDialog(context, widget.organization),
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Observer(
        builder: (context) => ListView(
          children: EmployeeStore.shared.employees
              .map((e) => EmployeeItem(e))
              .toList(),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, Organization organization) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Удалить организацию?'),
        content: const Text('Все контакты будут удалены'),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () async {
              Navigator.pop(context);
              await OrganizationStore.shared.deleteOrganization(organization);
              if (context.mounted) Navigator.maybePop(context);
            },
            child: const Text('Да'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Нет'),
          ),
        ],
      ),
    );
  }
}
