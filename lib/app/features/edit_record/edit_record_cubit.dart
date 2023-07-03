import 'package:bloc/bloc.dart';
import 'package:cross_ranking/app/app.dart';
import 'package:meta/meta.dart';

part 'edit_record_state.dart';

class EditRecordCubit extends Cubit<EditRecordState> {
  EditRecordCubit() : super(EditRecordInitial());

  Future<void> loadData(TrainingRecord? record) async {
    emit(EditRecordLoading());
    try {
      emit(
        EditRecordLoaded(),
      );
    } on Exception catch (e) {
      emit(
        EditRecordError(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> saveTrainingRecord(TrainingRecord record, String workoutId) async {
    emit(
      EditRecordLoading(),
    );
    try {
      await TrainingRecordRepository.saveTrainingRecord(record, workoutId);
      emit(
        EditRecordSuccess(),
      );
    } on Exception catch (e) {
      emit(
        EditRecordError(errorMessage: e.toString()),
      );
    }
  }

  // (Category? value) {
  // setState(() {
  // if (value != null) {
  // selectedCategory = value;
  // widget.onChanged(value);
  // }
  // });
  // },
  void onChangeCategory(Category? category) {
    if (category != null) {
      emit(EditRecordLoaded(selectedCategory: category));
    }
  }
}
