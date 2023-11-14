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
  EmployeeEditStore editStore = EmployeeEditStore.shared;
  late FocusNode focusNode;
  late TextEditingController nameController,
      firsrNameController,
      lastNameController,
      orgController,
      jobTitleController,
      descriptionController;

  @override
  void initState() async {
    await editStore.init(widget.employee);
    focusNode = FocusNode();
    nameController = TextEditingController(text: editStore.name);
    firsrNameController = TextEditingController(text: editStore.firstName);
    lastNameController = TextEditingController(text: editStore.lastName);
    orgController = TextEditingController(text: editStore.selectedOrg.name);
    jobTitleController = TextEditingController(text: editStore.jobTitle);
    descriptionController = TextEditingController(text: editStore.description);

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
      appBar: PhoneAppBar(title: widget.employee?.firstName ?? 'Создать'),
      body: Observer(
        builder: (context) => ListView(
          padding: const EdgeInsets.all(32),
          children: [
            RawAutocomplete<String>(
              optionsBuilder: (value) {
                if (value.text.isEmpty) return [];
                return editStore.organizations
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
                              onTap: () => onSelected(e),
                            ),
                          )
                          .toList()),
                );
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return AppTextEditField(
                  controller: orgController,
                  labelText: 'Организация',
                  autofocus: true,
                  onFieldSubmitted: editStore.setOrganization,
                );
              },
              textEditingController: orgController,
              focusNode: focusNode,
            ),
            AppTextEditField(
              controller: firsrNameController,
              labelText: 'Фамилия',
              onFieldSubmitted: editStore.setFirstName,
            ),
            AppTextEditField(
              controller: nameController,
              labelText: 'Имя',
              onFieldSubmitted: editStore.setName,
            ),
            AppTextEditField(
              controller: lastNameController,
              labelText: 'Отчество',
              onFieldSubmitted: editStore.setLastName,
            ),
            ...editStore.phones
                .map(
                  (p) => PhoneItem(
                    phone: p,
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
              onFieldSubmitted: editStore.setJobTitle,
            ),
            AppTextEditField(
              controller: descriptionController,
              labelText: 'Примечание',
              onFieldSubmitted: editStore.setDescription,
            ),
            AppSaveButton(onTap: () => editStore.saveEmployee()),
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
}
