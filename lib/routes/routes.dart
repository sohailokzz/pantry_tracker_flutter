import 'package:flutter/material.dart';
import '../ui/screens/home_screen.dart';
import 'routes_names.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.splashscreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const SplashScreen(),
      //   );

      /// Main Screen
      case RoutesName.homepage:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      // case RoutesName.rateUs:
      //   return MaterialPageRoute(
      //     builder: (_) => const RateUs(),
      //   );

      /// Passing arguments as param
      //   case EditNoteScreen.routeName:
      //     final NotesModel notesModel = settings.arguments as NotesModel;
      //
      //     return MaterialPageRoute(builder: (_) => EditNoteScreen(notesModel: notesModel));
//     final NotesModel notesModel = settings.arguments as NotesModel;
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
