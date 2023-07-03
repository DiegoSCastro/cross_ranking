part of 'edit_record_cubit.dart';

@immutable
abstract class EditRecordState {}

class EditRecordInitial extends EditRecordState {}

class EditRecordLoading extends EditRecordState {}

class EditRecordLoaded extends EditRecordState {
  final Record? record;
  final Category selectedCategory;

  EditRecordLoaded({
    this.record,
    this.selectedCategory = Category.scaled,
  });
}

class EditRecordError extends EditRecordState {
  final String errorMessage;

  EditRecordError({required this.errorMessage});
}

class EditRecordSuccess extends EditRecordState {}
