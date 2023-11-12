import 'package:flutter/material.dart';
import 'package:phone_book/models/phone.dart';
import 'package:phone_book/presentation/edit_screen/app_save_button.dart';
import 'package:phone_book/presentation/edit_screen/app_textfiled.dart';

class AddPhoneBottomSheet extends StatefulWidget {
  final Phone? phone;
  const AddPhoneBottomSheet(this.phone, {super.key});

  @override
  State<StatefulWidget> createState() => AddPhoneBottomSheetState();
}

class AddPhoneBottomSheetState extends State<AddPhoneBottomSheet> {
  late TextEditingController descriptionController, numberController;
  late FocusNode focusNode;

  List<String> variants = [
    'мобильный',
    'рабочий',
    'служебный',
    'другое',
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
              return variants.where((e) => e.toLowerCase().contains(
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
            fieldViewBuilder:
                (context, textEditingController, focusNode, onFieldSubmitted) {
              return AppTextEditField(
                controller: textEditingController,
                focusNode: focusNode,
                autofocus: true,
                labelText: 'Описание',
              );
            },
            textEditingController: descriptionController,
            focusNode: FocusNode(),
          ),
          AppTextEditField(
            controller: numberController,
            labelText: 'Номер',
            keyboardType: TextInputType.number,
          ),
          AppSaveButton(onTap: () {}),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
