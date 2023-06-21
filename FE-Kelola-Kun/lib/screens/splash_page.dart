import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/screens/auth/welcome_back_page.dart';
import 'package:ecommerce_int2/screens/superadmin/dashboard_super_admin_page.dart';
import 'package:ecommerce_int2/screens/user/main/main_page.dart';
import 'package:ecommerce_int2/screens/user/profile/profile_page.dart';
import 'package:ecommerce_int2/screens/user/profile/purchase_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => PurchasePage()));
  }

  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(color: transparentBlue),
        child: SafeArea(
          child: Container(
            child: new Scaffold(
              body: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Opacity(
                          opacity: opacity.value,
                          child: new Image.asset('assets/logo.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(text: 'Powered by '),
                              TextSpan(
                                  text: 'Kelompok PBKK C',
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
