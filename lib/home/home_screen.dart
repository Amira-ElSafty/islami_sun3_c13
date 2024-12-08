import 'package:flutter/material.dart';
import 'package:islami_sun3_c13/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<String> backgroundImages = [
    'assets/images/quran_bg.png',
    'assets/images/hadeth_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png',
  ];
  List<String> bottomNavImages = [
    'assets/images/icon_quran.png',
    'assets/images/icon_hadeth.png',
    'assets/images/icon_sebha.png',
    'assets/images/icon_radio.png',
    'assets/images/icon_time.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          // backgroundImages[selectedIndex]
          'assets/images/${getBackgroundImage()}.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(index: 0), label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(index: 1), label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(index: 2), label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(index: 3), label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(index: 4), label: 'Quran'),
                ]),
          ),
        ),
      ],
    );
  }

  String getBackgroundImage() {
    switch (selectedIndex) {
      case 0:
        return 'quran_bg';
      case 1:
        return 'hadeth_bg';
      case 2:
        return 'sebha_bg';
      case 3:
        return 'radio_bg';
      case 4:
        return 'time_bg';
      default:
        return 'quran_bg';
    }
  }

  Widget builtItemInBottomNavBar({required int index}) {
    return selectedIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.blackBGColor),
            child: ImageIcon(AssetImage(bottomNavImages[index])))
        : ImageIcon(AssetImage(bottomNavImages[index]));
  }
}
