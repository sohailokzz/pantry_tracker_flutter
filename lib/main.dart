import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pantry/models/pantry_provider.dart';
import 'package:pantry/routes/routes.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';
import 'constants/text_styles.dart';
import 'firebase_options.dart';
import 'routes/routes_names.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PantryProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pantry Tracker',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          useMaterial3: true,
          textTheme: AppTextStyles.textTheme,
        ),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: RoutesName.splashscreen,
      ),
    );
  }
}
