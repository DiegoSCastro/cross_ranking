import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../app.dart';

part 'edit_workout_state.dart';

class EditWorkoutCubit extends Cubit<EditWorkoutState> {
  EditWorkoutCubit() : super(EditWorkoutInitial());

  Future<void> loadData(WorkoutDay? workoutDay) async {
    emit(
      EditWorkoutLoading(),
    );
    await Future.delayed(const Duration(seconds: 2));
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

  Future<void> saveWorkoutDay(WorkoutDay workoutDay) async {
    emit(
      EditWorkoutLoading(),
    );
    try {
      await WorkoutDayRepository.saveWorkoutDay(workoutDay);
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
