import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class SuraContentItem extends StatelessWidget {
  String content;

  int index;

  SuraContentItem({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primaryDark, width: 2)),
      child: Text(
        '$content [${index + 1}]',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.primaryDark, fontSize: 18),
      ),
    );
  }
}
