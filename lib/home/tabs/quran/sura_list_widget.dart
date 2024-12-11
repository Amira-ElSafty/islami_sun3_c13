import 'package:flutter/material.dart';
import 'package:islami_sun3_c13/app_colors.dart';
import 'package:islami_sun3_c13/model/sura_model.dart';

class SuraListWidget extends StatelessWidget {
  SuraModel suraModel;

  SuraListWidget({required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(alignment: Alignment.center, children: [
          Image.asset('assets/images/vector_image.png'),
          Text(
            '${suraModel.index + 1}',
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ]),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    suraModel.suraEnglishName,
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                  Text(
                    '${suraModel.numOfVerses} Verses',
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ],
              ),
              Text(
                suraModel.suraArabicName,
                style: TextStyle(color: AppColors.whiteColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
