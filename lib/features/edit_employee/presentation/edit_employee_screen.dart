import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:phone_book/core/models/models.dart';
import 'package:phone_book/features/edit_employee/edit_employee_store.dart';
import 'package:phone_book/features/edit_employee/presentation/add_phone_bootomsheet.dart';
import 'package:phone_book/core/presentation/app_save_button.dart';
import 'package:phone_book/core/presentation/app_textfiled.dart';
import 'package:phone_book/core/presentation/phone_item.dart';
import 'package:phone_book/core/presentation/phone_appbar.dart';

class EmployeeEditScreen extends StatefulWidget {
  final Employee? employee;
  const EmployeeEditScreen(this.employee, {super.key});

  @override
  State<StatefulWidget> createState() => EmployeeEditScreenState();
}

class EmployeeEditScreenState extends State<EmployeeEditScreen> {
  late FocusNode focusNode;
  late TextEditingController nameController,
      firsrNameController,
      lastNameController,
      orgController,
      jobTitleController,
      descriptionController;

  @override
  void initState() {
    focusNode = FocusNode();
    nameController = TextEditingController(text: EmployeeEditStore.shared.name);
    firsrNameController =
        TextEditingController(text: EmployeeEditStore.shared.firstName);
    lastNameController =
        TextEditingController(text: EmployeeEditStore.shared.lastName);
    orgController =
        TextEditingController(text: EmployeeEditStore.shared.selectedOrg.name);
    jobTitleController =
        TextEditingController(text: EmployeeEditStore.shared.jobTitle);
    descriptionController =
        TextEditingController(text: EmployeeEditStore.shared.description);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    firsrNameController.dispose();
    lastNameController.dispose();
    orgController.dispose();
    jobTitleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PhoneAppBar(
        title: widget.employee?.firstName ?? 'Создать',
        actions: widget.employee != null
            ? [
                IconButton(
                  onPressed: () => _showDeleteDialog(context, widget.employee!),
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.black,
                  ),
                ),
              ]
            : [],
      ),
      body: Observer(
        builder: (context) => ListView(
          padding: const EdgeInsets.all(32),
          children: [
            RawAutocomplete<String>(
              optionsBuilder: (value) {
                if (value.text.isEmpty) return [];
                return EmployeeEditStore.shared.organizations
                    .map((org) => org.name)
                    .toList()
                    .where((name) => name.toLowerCase().contains(
                          value.text.toLowerCase(),
                        ));
              },
              optionsViewBuilder: (BuildContext context,
                  void Function(String) onSelected, Iterable<String> options) {
                return Material(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: options
                          .map(
                            (e) => ListTile(
                                title: Text(e),
                                onTap: () {
                                  onSelected(e);
                                  EmployeeEditStore.shared.setOrganization(e);
                                }),
                          )
                          .toList()),
                );
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return AppTextEditField(
                  controller: orgController,
                  readOnly: widget.employee != null,
                  labelText: 'Организация',
                  autofocus: true,
                  focusNode: widget.employee == null ? focusNode : null,
                  onFieldSubmitted: EmployeeEditStore.shared.setOrganization,
                );
              },
              textEditingController: orgController,
              focusNode: focusNode,
            ),
            AppTextEditField(
              controller: firsrNameController,
              labelText: 'Фамилия',
              onFieldSubmitted: EmployeeEditStore.shared.setFirstName,
            ),
            AppTextEditField(
              controller: nameController,
              labelText: 'Имя',
              onFieldSubmitted: EmployeeEditStore.shared.setName,
            ),
            AppTextEditField(
              controller: lastNameController,
              labelText: 'Отчество',
              onFieldSubmitted: EmployeeEditStore.shared.setLastName,
            ),
            ...EmployeeEditStore.shared.phones
                .map(
                  (p) => PhoneItem(
                    phone: p,
                    deleteAction: true,
                    onTap: () => _showBottomSheet(context, p),
                  ),
                )
                .toList(),
            TextButton(
                onPressed: () => _showBottomSheet(context, null),
                child: const Text('Добавить номер')),
            AppTextEditField(
              controller: jobTitleController,
              labelText: 'Должность',
              onFieldSubmitted: EmployeeEditStore.shared.setJobTitle,
            ),
            AppTextEditField(
              controller: descriptionController,
              labelText: 'Примечание',
              onFieldSubmitted: EmployeeEditStore.shared.setDescription,
            ),
            AppSaveButton(onTap: () {
              EmployeeEditStore.shared.saveEmployee();
              Navigator.maybePop(context);
            }),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, Phone? phone) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      builder: (context) => AddPhoneBottomSheet(phone),
    );
  }

  void _showDeleteDialog(BuildContext context, Employee employee) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Удалить контакт?'),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () async {
              Navigator.pop(context);
              await EmployeeEditStore.shared.deleteEmployee(employee);
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
