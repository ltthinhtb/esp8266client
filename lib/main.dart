import 'package:esp8266/Dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyC7M4lYQi90Znf70RxzoSsnHX8eYsvaZ28",
      authDomain: "arduino-e2c20.firebaseapp.com",
      databaseURL: "https://arduino-e2c20-default-rtdb.firebaseio.com",
      projectId: "arduino-e2c20",
      storageBucket: "arduino-e2c20.appspot.com",
      messagingSenderId: "511391267193",
      appId: "1:511391267193:web:d5f3ed7b1707d8b65317a8",
      measurementId: "G-5GXBCBNP9Y"
  ));
  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}

