import 'package:flutter/material.dart';
import 'package:islami_sun3_c13/home/tabs/quran/sura_details_screen.dart';
import 'package:islami_sun3_c13/home/tabs/quran/sura_list_widget.dart';
import 'package:islami_sun3_c13/model/sura_model.dart';
import 'package:islami_sun3_c13/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/app_colors.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  // void addSuraList() {
  //   for (int i = 0; i < 114; i++) {
  //     SuraModel.suraList.add(SuraModel(
  //         suraEnglishName: SuraModel.suraEnglishNameList[i],
  //         suraArabicName: SuraModel.suraArabicNameList[i],
  //         numOfVerses: SuraModel.numOfVersesList[i],
  //         fileName: '${i + 1}.txt'));
  //   }
  // }

  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          suraEnglishName: SuraModel.suraEnglishNameList[i],
          suraArabicName: SuraModel.suraArabicNameList[i],
          numOfVerses: SuraModel.numOfVersesList[i],
          index: i + 1));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addSuraList();
    loadLastSura();

    /// 114
  }

  List<SuraModel> filterList = SuraModel.suraList;

  /// 114
  String searchText = '';
  Map<String, String> loadSura = {};

  // List<SuraModel> searchResultList = [];

  /*
  suraList => 114
  searchText
  searchText => suraList => item
   */

  @override
  Widget build(BuildContext context) {
    // loadLastSura();
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset('assets/images/logo.png')),
          TextField(
            style: TextStyle(color: AppColors.whiteColor),
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
                hintText: 'Sura Name',
                hintStyle: AppStyles.bold16White,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.primaryDark)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.primaryDark)),
                prefixIcon: const ImageIcon(
                    color: AppColors.primaryDark,
                    AssetImage('assets/images/icon_search.png'))),
            onChanged: (text) {
              searchText = text;
              filterList = SuraModel.suraList.where((sura) {
                return sura.suraArabicName.contains(searchText) ||
                    sura.suraEnglishName
                        .toLowerCase()
                        .contains(searchText.toLowerCase());
              }).toList();
              setState(() {});
            },
          ),
          const SizedBox(
            height: 20,
          ),
          searchText.isNotEmpty ? SizedBox() : builtMostRecentlyWidget(),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Suras List',
            style: AppStyles.bold16White,
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
                  onTap: () async {
                    // save data
                    saveLastSura(
                        suraEnName: filterList[index].suraEnglishName,
                        suraArName: filterList[index].suraArabicName,
                        numOfVerses: filterList[index].numOfVerses);
                    // Future.delayed(Duration(seconds: 2),(){
                    //   loadLastSura();
                    // });
                    Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                        arguments:
                            // searchResultList.isNotEmpty?
                            //     searchResultList[index]
                            //     :
                            filterList[index]);
                  },
                  child: SuraListWidget(
                    // index: index,
                    suraModel:
                        // searchResultList.isNotEmpty?
                        //     searchResultList[index]:
                        filterList[index],
                  ));
            },
            itemCount:
                // searchResultList.isNotEmpty?
                //     searchResultList.length:
                filterList.length,
          ))
        ],
      ),
    );
  }

  Widget builtMostRecentlyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most Recently ',
          style: AppStyles.bold16White,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loadSura['suraEnName'] ?? "",
                    style: AppStyles.bold24Black,
                  ),
                  Text(
                    loadSura['suraArName'] ?? "",
                    style: AppStyles.bold24Black,
                  ),
                  Text(
                    '${loadSura['numOfVerses']} Verses' ?? "",
                    style: AppStyles.bold18Black,
                  ),
                ],
              ),
              Image.asset('assets/images/most_recently_image.png')
            ],
          ),
        ),
      ],
    );
  }

  Future<void> saveLastSura(
      {required String suraEnName,
      required String suraArName,
      required String numOfVerses}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('suraArName', suraArName);
    await prefs.setString('numOfVerses', numOfVerses);
    await loadLastSura();
  }

  Future<Map<String, String>> getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = prefs.getString('suraEnName') ?? "";
    String suraArName = prefs.getString('suraArName') ?? "";
    String numOfVerses = prefs.getString('numOfVerses') ?? "";
    return {
      'suraEnName': suraEnName,
      'suraArName': suraArName,
      'numOfVerses': numOfVerses,
    };
  }

  loadLastSura() async {
    loadSura = await getLastSura();
    setState(() {});
  }
}
