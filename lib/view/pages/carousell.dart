import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:omdb/constant/color_pallete.dart';
import 'package:omdb/view/widgets/home.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Carousell extends StatelessWidget {
  const Carousell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CarousellPage extends StatefulWidget {
  const CarousellPage({Key? key}) : super(key: key);

  @override
  _CarousellPageState createState() => _CarousellPageState();
}

class _CarousellPageState extends State<CarousellPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  //make shared prefs visited
  void makeVisited() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('visited', true);
  }

  void _onIntroEnd(context) {
    makeVisited();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (_) => HomeWidget(
                title: 'Elemes Movie',
              )),
    );
  }

  Widget _buildImage(String assetName) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(left: 15),
        child: Column(
          children: [
            SizedBox(height: 60.0),
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Image.asset(
                'assets/$assetName.png',
                width: 100.0,
                height: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: ColorPalette.textColor),
              ),
            ),
          ],
        ),
      ),
      alignment: Alignment.topCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    );
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w400,
        color: ColorPalette.textColor,
      ),
      bodyTextStyle: bodyStyle,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      backgroundColor: ColorPalette.themeColor,
      body: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: "All about Movies",
            body:
                "1. Top rated movies\n 2. Upcoming movies\n 3. Now playing movies\n",
            image: _buildImage('logo'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "More features",
            body:
                "4. Popular movies\n 5. Popular TV shows\n 6. Top rated TV shows \n",
            image: _buildImage('logo'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Extra features",
            body:
                "7. On the air TV shows\n 8. Airing today TV shows\n 9. Popular people\n",
            image: _buildImage('logo'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () =>
            //navigate to home
            _onIntroEnd(context),

        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: Container(
          width: 70,
          height: 35,
          child: Center(
            child: Text(
              "Skip",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          //rounded border
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: ColorPalette.textColor,
          ),
        ),
        next: Container(
          width: 70,
          height: 35,
          child: Center(
            child: Text(
              "Next",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          //rounded border
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: ColorPalette.textColor,
          ),
        ),
        done: Container(
          width: 70,
          height: 35,
          child: Center(
            child: Text(
              "Done",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          //rounded border
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: ColorPalette.textColor,
          ),
        ),
        dotsDecorator: const DotsDecorator(
          spacing: EdgeInsets.all(2.5),
          size: Size(10.0, 10.0),
          activeColor: Colors.white,
          color: Colors.white,
          activeSize: Size(35.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
