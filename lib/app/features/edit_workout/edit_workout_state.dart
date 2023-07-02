part of 'edit_workout_cubit.dart';

@immutable
abstract class EditWorkoutState {}

class EditWorkoutInitial extends EditWorkoutState {}

class EditWorkoutLoading extends EditWorkoutState {}

class EditWorkoutLoaded extends EditWorkoutState {
  final DateTime date;
  final WorkoutDay? workoutDay;

  EditWorkoutLoaded({
    required this.date,
    this.workoutDay,
  });
}

class EditWorkoutError extends EditWorkoutState {
  final String errorMessage;

  EditWorkoutError({required this.errorMessage});
}

class EditWorkoutSuccess extends EditWorkoutState {}
