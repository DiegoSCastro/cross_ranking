import 'package:flutter/material.dart';

import '../app.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> get routes => {
        RouteName.home.route: (context) => const HomeScreen(),
        RouteName.editWorkout.route: (context) => const EditWorkoutScreen(),
        RouteName.editRecord.route: (context) => const EditRecordScreen(),
      };
}
