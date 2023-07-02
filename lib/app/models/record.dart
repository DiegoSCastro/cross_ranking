import 'package:cross_ranking/app/models/models.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'enum/enum.dart';

class Record {
  final String? id;
  final String name;
  final String value;
  final Category category;

  Record({
    this.id,
    required this.name,
    required this.value,
    required this.category,
  });

  factory Record.fromParse(ParseObject object) {
    return Record(
      id: object.get<String?>('objectId'),
      name: object.get<String>('name') ?? '',
      value: object.get<String>('value') ?? '',
      category: object.get<Category>('category') ?? Category.scaled,
    );
  }

  ParseObject toParse(WorkoutDay workoutDay) {
    final record = ParseObject('record')
      ..set<String?>('objectId', id)
      ..set<String>('name', name)
      ..set<String>('value', value)
      ..set<Category?>('category', category)
      ..set<String?>('category', workoutDay.id);
    return record;
  }
}
