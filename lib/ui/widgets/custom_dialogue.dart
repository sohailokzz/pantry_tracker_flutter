import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/pantry_provider.dart';
import 'items_form.dart';

class CustomDialog extends StatelessWidget {
  final String? itemId;

  CustomDialog({super.key, this.itemId});

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _data = {'name': '', 'quantity': ''};

  @override
  Widget build(BuildContext context) {
    final pantryProvider = Provider.of<PantryProvider>(context);

    void saveForm() async {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        if (itemId == null) {
          await pantryProvider.addPantry(_data);
        } else {
          await pantryProvider.updatePantry(itemId!, _data);
        }
        Navigator.of(context).pop();
      }
    }

    return AlertDialog(
      title: Text(itemId == null ? 'Add Item' : 'Edit Item'),
      content: ItemForm(
        formKey: _formKey,
        data: _data,
        itemId: itemId,
        onSave: saveForm,
      ),
    );
  }
}
