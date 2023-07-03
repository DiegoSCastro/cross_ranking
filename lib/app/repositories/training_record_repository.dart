import 'dart:developer';

import 'package:cross_ranking/app/app.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class TrainingRecordRepository {
  static Future<void> saveTrainingRecord(TrainingRecord record, String workoutId) async {
    final recordParse = record.toParse(workoutId);
    final response = await recordParse.save();
    log(response.success.toString());
  }

  static Future<List<TrainingRecord>> getAllTrainingRecords(String workoutId) async {
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject('record'));
    queryBuilder.whereEqualTo('workoutId', workoutId);
    queryBuilder.orderByAscending('name');

    try {
      final response = await queryBuilder.query();
      log(response.success.toString());
      return response.results?.map((po) => TrainingRecord.fromParse(po)).toList() ?? [];
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
