import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

class WorkoutDetailScreen extends StatefulWidget {
  final Workout workout;

  const WorkoutDetailScreen({super.key, required this.workout});

  @override
  State<WorkoutDetailScreen> createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  late final WorkoutDetailCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<WorkoutDetailCubit>();
    cubit.loadData(widget.workout.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.workout.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: BlocConsumer<WorkoutDetailCubit, WorkoutDetailState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is WorkoutDetailLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is WorkoutDetailLoaded) {
                return SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          widget.workout.date?.toDateString() ?? '',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.workout.description,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditRecordScreen(
                                  workoutId: widget.workout.id ?? '',
                                ),
                              ),
                            );
                          },
                          child: const Text('Adicionar recorde'),
                        ),
                        const SizedBox(height: 32),
                        CategoryListBuilder(
                          title: 'Scaled',
                          imageAsset: AppAssets.scaled,
                          titleColor: AppColors.bronze,
                          records: state.scaledRecords,
                        ),
                        const SizedBox(height: 32),
                        CategoryListBuilder(
                          title: 'RX',
                          imageAsset: AppAssets.rx,
                          titleColor: AppColors.silver,
                          records: state.rXRecords,
                        ),
                        const SizedBox(height: 32),
                        CategoryListBuilder(
                          title: 'Elite',
                          imageAsset: AppAssets.elite,
                          titleColor: AppColors.gold,
                          records: state.eliteRecords,
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                );
              }
              if (state is WorkoutDetailError) {
                return const Center(
                  child: Text('Erro ao carregar dados'),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
