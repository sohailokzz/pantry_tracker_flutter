import 'package:flutter/material.dart';
import 'package:pantry/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.2,
                  0.5,
                ],
                colors: [
                  AppColors.primaryColor,
                  Colors.white,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
