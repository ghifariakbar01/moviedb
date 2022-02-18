import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omdb/constant/constants.dart';
import 'package:omdb/providers.dart';
import 'package:omdb/utils/routes.dart';
import 'package:omdb/view/splashscreen/splashscreen.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/MyApp': (BuildContext context) => MyApp(),
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: '1.0,0',
  );
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _initPackageInfo();
  }

  @override
  void initState() {
    super.initState();

    // _initPackageInfo();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: MaterialApp(
            title: appTitle,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
                  TargetPlatform.iOS: FadeThroughPageTransitionsBuilder(),
                },
              ),
              indicatorColor: Colors.grey.shade100,
              canvasColor: Colors.transparent,
              fontFamily: 'Proppins',
            ),
            initialRoute: '/',
            routes: appRoutes));
  }
}
