import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/app_colors.dart';
import 'package:islami_sun3_c13/home/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami_sun3_c13/model/hadeth_model.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadethList = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (hadethList.isEmpty) {
      loadHadethFile();
    }
    return Container(
      child: Column(
        children: [
          Image.asset('assets/images/logo.png'),
          hadethList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryDark,
                  ),
                )
              : CarouselSlider.builder(
                  options: CarouselOptions(
                    height: height * 0.66,
                    viewportFraction: 0.75,
                    enlargeCenterPage: true,
                    // enableInfiniteScroll: false
                  ),
                  itemCount: hadethList.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          HadethDetailsScreen.routeName,
                          arguments: hadethList[itemIndex]);
                    },
                    child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.primaryDark,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/hadeth_bg_image.png'))),
                        child: Column(
                          children: [
                            Text(
                              hadethList[itemIndex].title,
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.blackColor),
                            ),
                            Expanded(
                              child: Text(
                                hadethList[itemIndex].content.join(''),
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
        ],
      ),
    );
  }

  void loadHadethFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadethContent =
          await rootBundle.loadString('assets/files/h$i.txt');
      List<String> hadethLines = hadethContent.split('\n');
      String title = hadethLines[0]; // title
      hadethLines.removeAt(0);
      HadethModel hadethModel = HadethModel(title: title, content: hadethLines);
      hadethList.add(hadethModel);
      setState(() {});
    }
  }
}
