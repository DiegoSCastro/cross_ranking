import 'dart:developer';

import 'package:cross_ranking/app/models/models.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class WorkoutDayRepository {
  static Future<void> saveWorkoutDay(WorkoutDay workoutDay) async {
    final workoutDayParse = workoutDay.toParse();
    final response = await workoutDayParse.save();
    log(response.success.toString());
  }

  static Future<List<WorkoutDay>> getAllWorkouts() async {
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject('workoutDay'));
    queryBuilder.orderByAscending('date');

    try {
      final response = await queryBuilder.query();
      log(response.success.toString());
      return response.results?.map((po) => WorkoutDay.fromParse(po)).toList() ?? [];
    } on Exception catch (_) {
      throw Exception();
      // return Future.error(
      //   // ParseErrors.getDescription(
      //     ecode
      //   // )
      // );
    }
  }
}
