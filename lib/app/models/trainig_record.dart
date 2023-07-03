import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'enum/enum.dart';

class TrainingRecord {
  final String? id;
  final String name;
  final String value;
  final Category category;

  TrainingRecord({
    this.id,
    required this.name,
    required this.value,
    required this.category,
  });

  factory TrainingRecord.fromParse(ParseObject object) {
    return TrainingRecord(
      id: object.get<String?>('objectId'),
      name: object.get<String>('name') ?? '',
      value: object.get<String>('value') ?? '',
      category: object.get<String>('category')?.toCategory() ?? Category.scaled,
    );
  }

  ParseObject toParse(String workoutId) {
    final record = ParseObject('record')
      ..set<String?>('objectId', id)
      ..set<String>('name', name)
      ..set<String>('value', value)
      ..set<String>('category', category.name)
      ..set<String?>('workoutId', workoutId);
    return record;
  }
}
