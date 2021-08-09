import "package:flutter/material.dart";
import 'package:notes/pages/create_note.dart';
import "package:notes/pages/notes_page.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
      initialRoute: "create/",
      routes: {
        "/": (context) => Notes(),
        "/create" : (context) => CreatePage()
      },
    );
  }
}
