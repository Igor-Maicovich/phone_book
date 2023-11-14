import 'package:flutter/material.dart';
import 'package:phone_book/core/models/models.dart';
import 'package:phone_book/core/presentation/app_save_button.dart';
import 'package:phone_book/core/presentation/app_textfiled.dart';
import 'package:phone_book/features/edit_employee/edit_employee_store.dart';
import 'package:uuid/uuid.dart';

class AddPhoneBottomSheet extends StatefulWidget {
  final Phone? phone;
  const AddPhoneBottomSheet(this.phone, {super.key});

  @override
  State<StatefulWidget> createState() => AddPhoneBottomSheetState();
}

class AddPhoneBottomSheetState extends State<AddPhoneBottomSheet> {
  late TextEditingController descriptionController, numberController;
  late FocusNode focusNode;
  EmployeeEditStore store = EmployeeEditStore.shared;

  List<String> variants = [
    'Мобильный',
    'Рабочий',
    'Другое',
  ];

  @override
  void initState() {
    descriptionController =
        TextEditingController(text: widget.phone?.description ?? '');
    numberController = TextEditingController(text: widget.phone?.number ?? '');
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    numberController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RawAutocomplete<String>(
            optionsBuilder: (value) {
              if (value.text.isEmpty) return [];
              return variants.where(
                (e) => e.toLowerCase().contains(
                      value.text.toLowerCase(),
                    ),
              );
            },
            optionsViewBuilder: (
              BuildContext context,
              void Function(String) onSelected,
              Iterable<String> options,
            ) {
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
                      .toList(),
                ),
              );
            },
            fieldViewBuilder: (
              context,
              textEditingController,
              focusNode,
              onFieldSubmitted,
            ) {
              return AppTextEditField(
                controller: descriptionController,
                focusNode: focusNode,
                autofocus: true,
                labelText: 'Описание',
              );
            },
            textEditingController: descriptionController,
            focusNode: focusNode,
          ),
          AppTextEditField(
            controller: numberController,
            labelText: 'Номер',
            keyboardType: TextInputType.number,
          ),
          AppSaveButton(
            onTap: () => store.setPhone(
              Phone(
                  id: widget.phone?.id ?? const Uuid().v4(),
                  employeeId: '',
                  number: numberController.text,
                  description: descriptionController.text),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
