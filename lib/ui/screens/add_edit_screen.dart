import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/pantry_provider.dart';
import '../widgets/items_form.dart';

class AddEditItemScreen extends StatelessWidget {
  final String? itemId;

  AddEditItemScreen({super.key, this.itemId});

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
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(itemId == null ? 'Add Item' : 'Edit Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ItemForm(
          formKey: _formKey,
          data: _data,
          itemId: itemId,
          onSave: saveForm,
        ),
      ),
    );
  }
}
