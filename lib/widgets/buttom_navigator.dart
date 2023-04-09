import 'package:flutter/material.dart';
import 'package:only_guides/core/app_colors.dart';
import 'package:only_guides/core/app_images.dart';
import 'package:only_guides/feature/author/author_screen.dart';
import 'package:only_guides/feature/home/home_screen.dart';
import 'package:only_guides/feature/learn/learn_screen.dart';
import 'package:only_guides/feature/news/news_screen.dart';
import 'package:only_guides/feature/settings/settings_screen.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.color00ADEFBlue1,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white.withOpacity(0.5),
        currentIndex: index,
        onTap: (indexFrom) {
          setState(() {
            index = indexFrom;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              AppImages.navbarHomeActive,
              height: 25,
            ),
            icon: Image.asset(
              AppImages.navbarHome,
              height: 25,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              AppImages.navbarNewsActive,
              height: 25,
            ),
            icon: Image.asset(
              AppImages.navbarNews,
              height: 25,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              AppImages.navbarLearnActive,
              height: 25,
            ),
            icon: Image.asset(
              AppImages.navbarLearn,
              height: 25,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              AppImages.navbarAuthorActive,
              height: 25,
            ),
            icon: Image.asset(
              AppImages.navbarAuthor,
              height: 25,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              AppImages.navbarSettingsActive,
              height: 25,
            ),
            icon: Image.asset(
              AppImages.navbarSettings,
              height: 25,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}

List<Widget> pages = [
  const HomeScreen(),
  const NewsScreen(),
  const LearnScreen(),
  const AuthorScreen(),
  const SettingsScreen(),
];
