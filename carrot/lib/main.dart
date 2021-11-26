import 'package:beamer/beamer.dart';
import 'package:carrot/router/locations.dart';
import 'package:carrot/screens/start_screen.dart';
import 'package:carrot/screens/splash_screen.dart';
import 'package:carrot/states/user_provider.dart';
import 'package:flutter/material.dart';
import "package:carrot/uilts/logger.dart";
import 'package:provider/provider.dart';

// 글로벌로 설정해야함 ( 라우팅 관련 Beamer 에 위임 )
// 로그인 안되어있으면(false) AuthScreen 으로
final _routerDelegate = BeamerDelegate(guards: [
  BeamGuard(
      pathBlueprints: ["/"],
      check: (context, location) {
        return false;
      },
      showPage: BeamPage(child: StartScreen()))
], locationBuilder: BeamerLocationBuilder(beamLocations: [HomeLocation()]));

void main() {
  logger.d("Start App");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 1), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: _splashLoadWidget(snapshot));
        });
  }

  StatelessWidget _splashLoadWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      print("error occur while loading.");
      return Text("Error occur");
    } else if (snapshot.hasData) {
      return TomatoApp();
    } else {
      return SplashScreen();
    }
  }
}

class TomatoApp extends StatelessWidget {
  const TomatoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (BuildContext context) {
        return UserProvider();
      },
      child: MaterialApp.router(
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            fontFamily: "DoHyeon",
            hintColor: Colors.grey[400],
            textTheme: TextTheme(
                headline3: TextStyle(fontFamily: "DoHyeon"),
                button: TextStyle(color: Colors.white)),
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    primary: Colors.white,
                    minimumSize: Size(48, 48))),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 2,
                titleTextStyle:
                    TextStyle(color: Colors.black87, fontFamily: "DoHyeon"))),
        routeInformationParser: BeamerParser(),
        routerDelegate: _routerDelegate,
      ),
    );
  }
}
