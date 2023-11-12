import 'package:flutter/material.dart';
import 'package:phone_book/models/models.dart';
import 'package:phone_book/presentation/employees_screen/employee_item.dart';
import 'package:phone_book/presentation/main_screen/phone_appbar.dart';
import 'package:phone_book/services/drift_service.dart';

class EmployeesScreen extends StatefulWidget {
  final Organization organization;
  const EmployeesScreen(this.organization, {super.key});

  @override
  State<StatefulWidget> createState() => EmployeesScreenState();
}

class EmployeesScreenState extends State<EmployeesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PhoneAppBar(title: widget.organization.name),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: DriftService().selectEmploeeys(widget.organization.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: snapshot.data!.map((e) => EmployeeItem(e)).toList(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
