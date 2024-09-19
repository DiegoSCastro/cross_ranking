import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

class EditWorkoutScreen extends StatefulWidget {
  final Workout? workoutDay;
  const EditWorkoutScreen({
    super.key,
    this.workoutDay,
  });

  @override
  State<EditWorkoutScreen> createState() => _EditWorkoutScreenState();
}

class _EditWorkoutScreenState extends State<EditWorkoutScreen> {
  late final EditWorkoutCubit cubit;
  late final TextEditingController titleEC;
  late final TextEditingController descriptionEC;

  @override
  void initState() {
    super.initState();
    cubit = context.read<EditWorkoutCubit>();
    cubit.loadData(widget.workoutDay);
    titleEC = TextEditingController(text: widget.workoutDay?.title);
    descriptionEC = TextEditingController(text: widget.workoutDay?.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocConsumer<EditWorkoutCubit, EditWorkoutState>(
          listener: (context, state) {
            if (state is EditWorkoutSuccess) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Treino salvo com sucesso'),
                ),
              );
              context.read<HomeCubit>().loadData();
            }
          },
          builder: (context, state) {
            if (state is EditWorkoutLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is EditWorkoutLoaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                child: Form(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DatePickerButton(
                          labelDate: state.date,
                          onDateTimeChanged: cubit.setDate,
                          initialDateTime: state.date,
                        ),
                        TextFormField(
                          controller: titleEC,
                          decoration: const InputDecoration(
                            label: Text('Titulo'),
                          ),
                        ),
                        TextFormField(
                          controller: descriptionEC,
                          minLines: 4,
                          maxLines: 15,
                          decoration: const InputDecoration(
                            label: Text('Descrição'),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            cubit.saveWorkoutDay(
                              Workout(
                                id: widget.workoutDay?.id,
                                date: state.date,
                                title: titleEC.text,
                                description: descriptionEC.text,
                              ),
                            );
                          },
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
