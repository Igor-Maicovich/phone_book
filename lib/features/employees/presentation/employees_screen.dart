import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:phone_book/core/models/models.dart';
import 'package:phone_book/core/presentation/phone_appbar.dart';
import 'package:phone_book/features/employees/employee_store.dart';
import 'package:phone_book/features/employees/presentation/employee_item.dart';

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
}
