import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_sun3_c13/app_colors.dart';
import 'package:islami_sun3_c13/home/tabs/quran/sura_content_item.dart';
import 'package:islami_sun3_c13/model/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(args.index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnglishName,
          style: TextStyle(color: AppColors.primaryDark),
        ),
      ),
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
                args.suraArabicName,
                style: TextStyle(color: AppColors.primaryDark, fontSize: 24),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryDark,
                      ))
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return SuraContentItem(
                            content: verses[index],
                            index: index,
                          );
                        },
                        itemCount: verses.length,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String suraContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = suraContent.split('\n');
    verses = suraLines;
    setState(() {});
  }
}
