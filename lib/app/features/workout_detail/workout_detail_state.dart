part of 'workout_detail_cubit.dart';

@immutable
abstract class WorkoutDetailState {}

class WorkoutDetailInitial extends WorkoutDetailState {}

class WorkoutDetailLoading extends WorkoutDetailState {}

class WorkoutDetailLoaded extends WorkoutDetailState {
  final List<TrainingRecord> records;

  List<TrainingRecord> get scaledRecords =>
      records.where((e) => e.category == Category.scaled).toList();

  List<TrainingRecord> get rXRecords => records.where((e) => e.category == Category.rx).toList();

  List<TrainingRecord> get eliteRecords =>
      records.where((e) => e.category == Category.elite).toList();

  WorkoutDetailLoaded({required this.records});
}

class WorkoutDetailError extends WorkoutDetailState {
  final String errorMessage;

  WorkoutDetailError({required this.errorMessage});
}
