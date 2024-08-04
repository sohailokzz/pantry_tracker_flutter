import 'package:flutter/material.dart';

class ItemForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic> data;
  final String? itemId;
  final VoidCallback onSave;

  const ItemForm({
    super.key,
    required this.formKey,
    required this.data,
    this.itemId,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) => value!.isEmpty ? 'Enter an Item' : null,
            onSaved: (value) => data['name'] = value,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Quantity'),
            keyboardType: TextInputType.number,
            validator: (value) => value!.isEmpty ? 'Enter a quantity' : null,
            onSaved: (value) => data['quantity'] = int.parse(value!),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onSave,
            child: Text(itemId == null ? 'Add' : 'Update'),
          ),
        ],
      ),
    );
  }
}
