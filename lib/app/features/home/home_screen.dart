import 'package:cross_ranking/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteName.editWorkout.route);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Matilha Ranking'),
        centerTitle: true,
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          if (state is HomeInitial) {
            return const Center(
              child: Text('initialState'),
            );
          }
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeLoaded) {
            if (state.workouts.isEmpty) {
              return const Center(
                child: Text('Vazio'),
              );
            }
            return ListView.builder(
                itemCount: state.workouts.length,
                itemBuilder: (context, index) {
                  final workout = state.workouts[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WorkoutDetailScreen(workout: workout),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (workout.date != null)
                            Text(
                              workout.date?.toDateString() ?? '',
                            ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(workout.title),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditWorkoutScreen(
                                    workoutDay: workout,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
          if (state is HomeError) {
            return const Center(
              child: Text('Erro ao carregar dados'),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
