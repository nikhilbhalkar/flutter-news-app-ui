import 'package:flutter/material.dart';
import 'package:newa_app_ui/artical_screen.dart';
import 'package:newa_app_ui/discover_screen.dart';
import 'package:newa_app_ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        HomeScreen.routeName:(context) => const HomeScreen(),
        DiscoverScreen.routeName:(context) => const DiscoverScreen(),
        ArticalScreen.routeName:(context) => const ArticalScreen(),
      },
    );
  }
}
