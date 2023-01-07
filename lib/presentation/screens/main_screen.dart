// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos/constance/strings_manager.dart';
import 'package:oranos/constance/themes/themes.dart';
import 'package:oranos/presentation/screens/home_screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> screens = [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: AppTheme.mainColor,
        onTap: (index) {
          changeIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(IconsAssetsManager.home),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(IconsAssetsManager.star),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(IconsAssetsManager.wallet),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(IconsAssetsManager.profile),
          ),
        ],
      ),
      body: screens[_currentIndex],
    );
  }
}
