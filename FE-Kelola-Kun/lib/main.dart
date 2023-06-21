import 'package:ecommerce_int2/api_service.dart';
import 'package:ecommerce_int2/screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kelola-Kun',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Colors.transparent,
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF076AE1),
        colorScheme: ColorScheme(
          background: Color(0xFFF5F5F5),
          brightness: Brightness.light,
          error: Color(0xFFE45C5C),
          onBackground: Color(0xFF076AE1),
          onError: Color(0xFFE45C5C),
          onPrimary: Color(0xFF076AE1),
          onSecondary: Color(0xFF076AE1),
          onSurface: Color(0xFF076AE1),
          primary: Color(0xFF076AE1),
          secondary: Color.fromARGB(255, 245, 144, 62),
          surface: Color(0xFF000000),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: SplashScreen(),
    );
  }
}
