import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/features/edit_employee/presentation/edit_employee_screen.dart';
import 'package:phone_book/core/presentation/phone_appbar.dart';
import 'package:phone_book/features/organizations/organization_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:phone_book/features/organizations/presentation/organization_item.dart';

class OrganizationScreen extends StatefulWidget {
  const OrganizationScreen({super.key});
  @override
  State<StatefulWidget> createState() => OrganizationScreenState();
}

class OrganizationScreenState extends State<OrganizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PhoneAppBar(
        title: 'Справочник',
        backAction: false,
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: OrganizationStore.shared.organizations.length,
          itemBuilder: (context, index) =>
              OrganizationItem(OrganizationStore.shared.organizations[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var org = await Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const EmployeeEditScreen(null),
            ),
          );
          if (org != null) OrganizationStore.shared.organizations.add(org);
        },
      ),
    );
  }
}
