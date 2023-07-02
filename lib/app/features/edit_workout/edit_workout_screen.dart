import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../../app.dart';

class EditWorkoutScreen extends StatefulWidget {
  final WorkoutDay? workoutDay;
  const EditWorkoutScreen({
    super.key,
    this.workoutDay,
  });

  @override
  State<EditWorkoutScreen> createState() => _EditWorkoutScreenState();
}

class _EditWorkoutScreenState extends State<EditWorkoutScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EditWorkoutCubit>().loadData(widget.workoutDay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<EditWorkoutCubit, EditWorkoutState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is EditWorkoutInitial) {
              return const Center(
                child: Text('initialState'),
              );
            }
            if (state is EditWorkoutLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is EditWorkoutLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                child: Form(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DatePickerButton(
                          labelDate: state.date,
                          onDateTimeChanged: context.read<EditWorkoutCubit>().setDate,
                          initialDateTime: state.date,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Titulo'),
                          ),
                        ),
                        TextFormField(
                          maxLines: 4,
                          decoration: const InputDecoration(
                            label: Text('Descrição'),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Salvar',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            if (state is EditWorkoutError) {
              return const Center(
                child: Text('Erro ao carregar dados'),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
