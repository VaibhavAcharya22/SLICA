//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slica/home_screen.dart';
import 'package:slica/login.dart';
import 'package:slica/faculties.dart';
import 'package:firebase_core/firebase_core.dart';
import 'faculties.dart';
import 'tmp2.dart';
import 'tmp3.dart';
import 'tmp.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(); // Necessary to Initialize Firebase Before do anything

  //Rotation Off in app
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
      title: 'SLICA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  MyApps(),
      routes: {
        '/a': (context) => LoginScreen(),
        '/b': (context) => HomeScreen(),
        '/c': (context) => Faculties(),

      },
    );
  }
}

