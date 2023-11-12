import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:phone_book/models/models.dart';
import 'package:phone_book/presentation/edit_screen/add_phone_bootomsheet.dart';
import 'package:phone_book/presentation/edit_screen/app_save_button.dart';

import 'package:phone_book/presentation/edit_screen/app_textfiled.dart';
import 'package:phone_book/presentation/edit_screen/phone_item.dart';
import 'package:phone_book/presentation/main_screen/phone_appbar.dart';

class EmployeeEditScreen extends StatefulWidget {
  final Employee? employee;
  const EmployeeEditScreen(this.employee, {super.key});

  @override
  State<StatefulWidget> createState() => EmployeeEditScreenState();
}

class EmployeeEditScreenState extends State<EmployeeEditScreen> {
  late TextEditingController nameController,
      firsrNameController,
      lastNameController,
      orgController,
      jobTitleController,
      descriptionController;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var maskFormatter = MaskTextInputFormatter(
      mask: '+# (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  List<Organization> organizations = [];
  List<Phone> phones = [];

  @override
  void initState() {
    nameController = TextEditingController(text: widget.employee?.name ?? '');
    firsrNameController =
        TextEditingController(text: widget.employee?.firstName ?? '');
    lastNameController =
        TextEditingController(text: widget.employee?.lastName ?? '');
    orgController = TextEditingController();
    jobTitleController =
        TextEditingController(text: widget.employee?.jobTitle ?? '');
    descriptionController =
        TextEditingController(text: widget.employee?.description ?? '');
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
      key: _scaffoldKey,
      appBar: PhoneAppBar(title: widget.employee?.firstName ?? 'Создать'),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: ListView(
            children: [
              AppTextEditField(
                controller: orgController,
                labelText: 'Организация',
                inputFormatters: [maskFormatter],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Обязательно к заполнению';
                  }
                  return null;
                },
              ),
              AppTextEditField(
                controller: firsrNameController,
                labelText: 'Фамилия',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Обязательно к заполнению';
                  }
                  return null;
                },
              ),
              AppTextEditField(
                controller: nameController,
                labelText: 'Имя',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Обязательно к заполнению';
                  }
                  return null;
                },
              ),
              AppTextEditField(
                controller: lastNameController,
                labelText: 'Отчество',
              ),
              ...phones
                  .map(
                    (p) => PhoneItem(
                      phone: p,
                      onTap: () => _showBottomSheet(context, p),
                    ),
                  )
                  .toList(),
              TextButton(
                  onPressed: () => _showBottomSheet(context, null),
                  child: Text('Добавить номер')),
              AppTextEditField(
                controller: jobTitleController,
                labelText: 'Должность',
              ),
              AppTextEditField(
                controller: descriptionController,
                labelText: 'Примечание',
              ),
              AppSaveButton(onTap: () {}),
            ],
          ),
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
