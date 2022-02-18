import 'dart:math';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:omdb/constant/color_pallete.dart';
import 'package:omdb/view/pages/favorit.dart';
import 'package:omdb/view/pages/tv.dart';
import 'package:provider/provider.dart';
import '../pages/home.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  bool keyboardOpen = false;
  int _currentIndex = 0;
  final List _children = [
    HomePage(),
    TVPage(),
    FavoritPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
    //set provider provId
  }

  final iconList = <IconData>[Icons.movie, Icons.tv, Icons.favorite];

  // final titleList = <String>["Beranda", "Forum", "Donasi", "Toko"];

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  late String _provId;

  String randomString(int length) {
    var rand = new Random();
    var codeUnits = new List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });
    return new String.fromCharCodes(codeUnits);
  }

  @override
  Widget build(BuildContext context) {
    final autoSizeGroup = AutoSizeGroup();

    return LiquidPullToRefresh(
      springAnimationDurationInMilliseconds: 125,
      height: 50,
      color: Colors.white,
      showChildOpacityTransition: false,
      backgroundColor: Colors.black,
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          _provId = randomString(10);
          print('id called');
        });
      },
      child: Scaffold(
        extendBody: true,
        drawerScrimColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        body: _children[_currentIndex],
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color =
                isActive ? ColorPalette.textColor : Colors.grey.shade100;
            return Container(
              margin: EdgeInsets.all(3),
              child: Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
            );
          },
          splashColor: ColorPalette.textColor,
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 500,
          backgroundColor: ColorPalette.themeColor,
          activeIndex: _currentIndex,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          onTap: (index) => setState(() => _currentIndex = index),
          //other params
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: keyboardOpen ? SizedBox() : _buildFab(context),
      ),
    );
  }
}

// const SizedBox(height: 7),
// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 8),
//   child: AutoSizeText(
//     // titleList[index],
//     maxLines: 1,
//     style: TextStyle(
//       color: color,
//       fontFamily: "Poppins",
//       fontSize: 9,
//     ),
//     group: autoSizeGroup,
//   ),
// )
