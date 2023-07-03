import 'package:cross_ranking/app/models/enum/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

class EditRecordScreen extends StatefulWidget {
  final String workoutId;
  final TrainingRecord? record;
  const EditRecordScreen({
    super.key,
    required this.workoutId,
    this.record,
  });

  @override
  State<EditRecordScreen> createState() => _EditRecordScreenState();
}

class _EditRecordScreenState extends State<EditRecordScreen> {
  late final EditRecordCubit cubit;
  late final TextEditingController nameEC;
  late final TextEditingController valueEC;
  @override
  void initState() {
    super.initState();
    cubit = context.read<EditRecordCubit>();
    cubit.loadData(widget.record);
    nameEC = TextEditingController(text: widget.record?.name);
    valueEC = TextEditingController(text: widget.record?.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Adicionar recorde'),
      ),
      body: BlocConsumer<EditRecordCubit, EditRecordState>(
        listener: (context, state) {
          if (state is EditRecordSuccess) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Recorde salvo com sucesso'),
              ),
            );
            context.read<WorkoutDetailCubit>().loadData(widget.workoutId);
          }
        },
        builder: (context, state) {
          if (state is EditRecordLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is EditRecordLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
              child: Form(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: Category.values.map((Category category) {
                          return ListTile(
                            title: Text(category.toString().split('.').last.toUpperCase()),
                            leading: Radio<Category>(
                              value: category,
                              groupValue: state.selectedCategory,
                              onChanged: cubit.onChangeCategory,
                            ),
                          );
                        }).toList(),
                      ),
                      TextFormField(
                        controller: nameEC,
                        decoration: const InputDecoration(
                          label: Text('Nome'),
                        ),
                      ),
                      TextFormField(
                        controller: valueEC,
                        decoration: const InputDecoration(
                          label: Text('Resultado'),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final record = TrainingRecord(
                            name: nameEC.text,
                            value: valueEC.text,
                            category: state.selectedCategory,
                          );

                          cubit.saveTrainingRecord(record, widget.workoutId);
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
          if (state is WorkoutDetailError) {
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
