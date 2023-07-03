import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../app.dart';

part 'edit_workout_state.dart';

class EditWorkoutCubit extends Cubit<EditWorkoutState> {
  EditWorkoutCubit() : super(EditWorkoutInitial());

  Future<void> loadData(Workout? workoutDay) async {
    emit(
      EditWorkoutLoading(),
    );
    try {
      emit(
        EditWorkoutLoaded(
          workoutDay: workoutDay,
          date: workoutDay?.date ?? DateTime.now(),
        ),
      );
    } on Exception catch (e) {
      emit(
        EditWorkoutError(errorMessage: e.toString()),
      );
    }
  }

  void setDate(DateTime value) {
    if (state is EditWorkoutLoaded) {
      emit(EditWorkoutLoaded(date: value));
    }
  }

  Future<void> saveWorkoutDay(Workout workoutDay) async {
    emit(
      EditWorkoutLoading(),
    );
    try {
      await WorkoutRepository.saveWorkout(workoutDay);
      emit(
        EditWorkoutSuccess(),
      );
    } on Exception catch (e) {
      emit(
        EditWorkoutError(errorMessage: e.toString()),
      );
    }
  }
}
