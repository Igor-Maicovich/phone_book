import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/features/edit_employee/edit_employee_store.dart';
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
      appBar: PhoneAppBar(
        title: 'Справочник',
        backAction: false,
        actions: [
          IconButton(
            onPressed: () => _showUpdateDialog(context),
            icon: const Icon(
              Icons.update,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Observer(builder: (context) {
        if (OrganizationStore.shared.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: OrganizationStore.shared.organizations.length,
          itemBuilder: (context, index) =>
              OrganizationItem(OrganizationStore.shared.organizations[index]),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await EmployeeEditStore.shared.getData(null);
          if (context.mounted) {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const EmployeeEditScreen(null),
              ),
            ).then((value) => OrganizationStore.shared.init());
          }
        },
      ),
    );
  }

  void _showUpdateDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Обновить локальную базу?'),
        content: const Text('Все текущие локальные данные\nбудут удалены'),
        actions: [
          CupertinoDialogAction(
            onPressed: () async {
              Navigator.pop(context);
              OrganizationStore.shared.pullDataBase();
            },
            child: const Text('Да'),
          ),
          CupertinoDialogAction(
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
