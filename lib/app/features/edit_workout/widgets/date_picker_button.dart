import 'package:cross_ranking/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerButton extends StatelessWidget {
  final DateTime labelDate;
  final Function(DateTime) onDateTimeChanged;
  final DateTime? initialDateTime;
  const DatePickerButton({
    super.key,
    required this.labelDate,
    required this.onDateTimeChanged,
    this.initialDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showCupertinoModalPopup(
            context: context,
            builder: (_) {
              return Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 300,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        showDayOfWeek: false,
                        initialDateTime: initialDateTime,
                        onDateTimeChanged: onDateTimeChanged,
                        dateOrder: DatePickerDateOrder.dmy,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Selecionar Data'),
                      ),
                    )
                  ],
                ),
              );
            });
      },
      child: Text(labelDate.toDateString()),
    );
  }
}
