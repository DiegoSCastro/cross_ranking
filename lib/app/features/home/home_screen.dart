import 'package:cross_ranking/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
        title: const Text('Home'),
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
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeLoaded) {
            // return const Center(
            //   child: Text('Loaded'),
            // );
            if (state.workouts.isEmpty) {
              return Center(child: Text('Vazio'));
            }
            return ListView.builder(itemBuilder: (context, index) {
              final item = state.workouts[index];
              return Text(item.title);
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
