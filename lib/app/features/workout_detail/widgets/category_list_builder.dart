import 'package:flutter/material.dart';

import '../../../app.dart';

class CategoryListBuilder extends StatelessWidget {
  final String title;
  final String imageAsset;
  final Color titleColor;
  final List<TrainingRecord> records;
  const CategoryListBuilder({
    super.key,
    required this.title,
    required this.imageAsset,
    required this.titleColor,
    this.records = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: titleColor, fontSize: 32),
        ),
        Row(
          children: [
            Expanded(
              child: ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: records.length,
                  itemBuilder: (context, index) {
                    final record = records[index];
                    return Text(
                      '${record.name} - ${record.value}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Image.asset(
                imageAsset,
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
          ],
        )
      ],
    );
  }
}
