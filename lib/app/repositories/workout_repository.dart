import 'dart:developer';

import 'package:cross_ranking/app/models/models.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class WorkoutRepository {
  static Future<void> saveWorkout(Workout workout) async {
    final workoutDayParse = workout.toParse();
    final response = await workoutDayParse.save();
    log(response.success.toString());
  }

  static Future<List<Workout>> getAllWorkouts() async {
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject('workoutDay'));
    queryBuilder.orderByDescending('date');

    try {
      final response = await queryBuilder.query();
      log(response.success.toString());
      return response.results?.map((po) => Workout.fromParse(po)).toList() ?? [];
    } on Exception catch (_) {
      throw Exception();
    }
  }
}
