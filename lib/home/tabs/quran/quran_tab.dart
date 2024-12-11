import 'package:flutter/material.dart';
import 'package:islami_sun3_c13/app_colors.dart';
import 'package:islami_sun3_c13/home/tabs/quran/sura_details_screen.dart';
import 'package:islami_sun3_c13/home/tabs/quran/sura_list_widget.dart';
import 'package:islami_sun3_c13/model/sura_model.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset('assets/images/logo.png')),
          TextField(
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
                hintText: 'Sura Name',
                hintStyle: const TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.primaryDark)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.primaryDark)),
                prefixIcon: const ImageIcon(
                    color: AppColors.primaryDark,
                    AssetImage('assets/images/icon_search.png'))),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Most Recently ',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryDark),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sura En'),
                    Text('Sura Ar'),
                    Text('Aya Num'),
                  ],
                ),
                Image.asset('assets/images/most_recently_image.png')
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Suras List',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) {
              return const Divider(
                color: AppColors.whiteColor,
                thickness: 2,
                indent: 30.5,
                endIndent: 30,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                        arguments: SuraModel.getSuraModel(index));
                  },
                  child: SuraListWidget(
                    suraModel: SuraModel.getSuraModel(index),
                  ));
            },
            itemCount: SuraModel.getItemCount(),
          ))
        ],
      ),
    );
  }
}
