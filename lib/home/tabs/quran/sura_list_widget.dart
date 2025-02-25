import 'package:flutter/material.dart';
import 'package:islami_sun3_c13/model/sura_model.dart';

import '../../../utils/app_styles.dart';

class SuraListWidget extends StatelessWidget {
  SuraModel suraModel;

  // int index;

  SuraListWidget({required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(alignment: Alignment.center, children: [
          Image.asset('assets/images/vector_image.png'),
          Text(
            '${suraModel.index}',
            style: AppStyles.bold20White,
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
                    style: AppStyles.bold20White,
                  ),
                  Text(
                    '${suraModel.numOfVerses} Verses',
                    style: AppStyles.bold20White,
                  ),
                ],
              ),
              Text(
                suraModel.suraArabicName,
                style: AppStyles.bold20White,
              )
            ],
          ),
        ),
      ],
    );
  }
}
