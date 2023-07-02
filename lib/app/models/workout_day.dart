import 'package:parse_server_sdk/parse_server_sdk.dart';

class WorkoutDay {
  final String? id;
  final DateTime? date;
  final String title;
  final String description;
  final List<Record> records;

  WorkoutDay({
    this.id,
    required this.date,
    required this.title,
    required this.description,
    required this.records,
  });

  factory WorkoutDay.fromParse(ParseObject object) {
    return WorkoutDay(
      id: object.get<String?>('objectId'),
      date: object.get<DateTime?>('date'),
      title: object.get<String>('title') ?? '',
      description: object.get<String>('description') ?? '',
      records: object.get<List<Record>>('records') ?? [],
    );
  }

  ParseObject toParse() {
    final workoutDay = ParseObject('workoutDay')
          ..set<String?>('objectId', id)
          ..set<DateTime?>('date', date)
          ..set<String>('title', title)
          ..set<String>('description', description)
        // ..set<List<Record>>('records', records)
        ;
    return workoutDay;
  }
}
