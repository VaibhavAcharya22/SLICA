import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slica/home_screen.dart';
import 'package:slica/login.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:slica/tmp.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()),
  );
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  LoginScreen(),
      routes: <String, WidgetBuilder> {
        '/a': (BuildContext context) => LoginScreen(),
        '/b': (BuildContext context) => HomeScreen(),
        '/c': (BuildContext context) => TmpScreen(),
      },
    );
  }
}

