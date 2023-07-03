import 'package:bloc/bloc.dart';
import 'package:cross_ranking/app/app.dart';
import 'package:meta/meta.dart';

part 'workout_detail_state.dart';

class WorkoutDetailCubit extends Cubit<WorkoutDetailState> {
  WorkoutDetailCubit() : super(WorkoutDetailInitial());

  Future<void> loadData(String workoutId) async {
    emit(WorkoutDetailLoading());

    try {
      final records = await TrainingRecordRepository.getAllTrainingRecords(workoutId);
      emit(WorkoutDetailLoaded(records: records));
    } on Exception catch (e) {
      emit(
        WorkoutDetailError(errorMessage: e.toString()),
      );
    }
  }
}
