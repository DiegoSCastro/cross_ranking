part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Workout> workouts;
  HomeLoaded({required this.workouts});
}

class HomeError extends HomeState {
  final String errorMessage;

  HomeError({required this.errorMessage});
}
