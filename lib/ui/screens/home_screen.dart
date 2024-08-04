import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pantry/constants/colors.dart';
import 'package:pantry/constants/screen_utils.dart';
import 'package:pantry/models/pantry_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_dialogue.dart';
import 'add_edit_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pantryProvider = Provider.of<PantryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Pantry Tracker',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: pantryProvider.pantries,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          final items = snapshot.data?.docs ?? [];

          return ListView.builder(
            padding: const EdgeInsets.only(top: 16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final itemId = item.id;
              final itemName = item['name'];
              final itemQuantity = item['quantity'];
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.2,
                      0.5,
                    ],
                    colors: [
                      AppColors.primaryColor,
                      Colors.grey,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      itemName,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onPressed: () =>
                          pantryProvider.decreaseQuantity(itemId, itemQuantity),
                    ),
                    kWidth(8),
                    Text(
                      itemQuantity.toString(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    kWidth(8),
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () =>
                          pantryProvider.increaseQuantity(itemId, itemQuantity),
                    ),
                    kWidth(12),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () => pantryProvider.deletePantry(item.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => CustomDialog(),
          );
        },
      ),
    );
  }
}
