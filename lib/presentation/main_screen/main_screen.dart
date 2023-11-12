import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/models/organization.dart';
import 'package:phone_book/presentation/edit_screen/edit_employee_screen.dart';
import 'package:phone_book/presentation/main_screen/phone_appbar.dart';

import 'package:phone_book/presentation/main_screen/organization_item.dart';
import 'package:phone_book/services/drift_service.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});
  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<Mainscreen> {
  List<Organization> organizations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PhoneAppBar(
        title: 'Справочник',
        backAction: false,
      ),
      body: FutureBuilder<List<Organization>>(
          future: DriftService().selectOrganizations(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                organizations = snapshot.data!;
                return ListView.builder(
                  itemCount: organizations.length,
                  itemBuilder: (context, index) =>
                      OrganizationItem(organizations[index]),
                );
              }
              return Center(
                child: Text('Нет данных'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () async {
          var org = await Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const EmployeeEditScreen(null),
            ),
          );
          if (org != null) organizations.add(org);
          setState(() {});
        },
      ),
    );
  }
}
