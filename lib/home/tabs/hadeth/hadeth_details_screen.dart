import 'package:flutter/material.dart';
import 'package:islami_sun3_c13/app_colors.dart';
import 'package:islami_sun3_c13/model/hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColors.blackColor,
            child: Image.asset(
              'assets/images/details_screen_bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 17,
              ),
              Text(
                args.title,
                style: TextStyle(color: AppColors.primaryDark, fontSize: 24),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    return Text(
                      args.content[index],
                      style:
                          TextStyle(color: AppColors.primaryDark, fontSize: 18),
                    );
                  },
                  itemCount: args.content.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
