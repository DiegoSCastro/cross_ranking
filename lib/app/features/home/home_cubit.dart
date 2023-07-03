import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../app.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> loadData() async {
    emit(
      HomeLoading(),
    );
    try {
      final workouts = await WorkoutRepository.getAllWorkouts();
      emit(
        HomeLoaded(workouts: workouts),
      );
    } on Exception catch (e) {
      emit(
        HomeError(errorMessage: e.toString()),
      );
    }
  }
}
