import 'package:ecommerce_int2/api_service.dart';
import 'package:ecommerce_int2/screens/not_found_page.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../user/main/main_page.dart';

class WelcomeBackPage extends StatefulWidget {
  @override
  _WelcomeBackPageState createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget welcomeBack = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo.png',
          width: 150,
          height: 150,
        ),
        SizedBox(height: 36),
        Text(
          'Kelola-Kun',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );

    Widget loginButton = Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 60,
        width: 200,
        child: InkWell(
          onTap: () async {
            if (ApiService.bearerToken != '') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            }
            final message =
                await ApiService().login(username.text, password.text);
            // debugPrint(message);
            if (message == 'success') {
              _onBasicAlertPressed(context);
            } else {
              _onBasicAlertPressed(context);
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 80,
            child: Center(
                child: new Text("Login",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 28.0))),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF076AE1),
            ),
          ),
        ),
      ),
    );

    Widget forgotPassword = Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 20, left: 16),
      child: InkWell(
        onTap: () {},
        child: Text(
          'Forgot your password?',
          style: TextStyle(
            color: Color(0xFF627B87),
            fontWeight: FontWeight.w300,
            fontSize: 32.0,
          ),
        ),
      ),
    );

    Widget loginForm = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 220,
            width: 535,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFECEFFD),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  // height: 80,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // hintText: 'Password',
                      label: Text('Username'),
                      labelStyle: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w300,
                        // 0.4 of black hexa = 0x66000000
                        color: Color(0x66000000),
                      ),
                    ),
                    controller: username,
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFECEFFD),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  // height: 80,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // hintText: 'Password',
                      label: Text('Password'),
                      labelStyle: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w300,
                        // 0.4 of black hexa = 0x66000000
                        color: Color(0x66000000),
                      ),
                    ),
                    controller: password,
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.w300,
                    ),
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),
          forgotPassword,
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).colorScheme.background,
          ),
          Center(
            child: Container(
              width: 670,
              height: 820,
              child: Padding(
                padding: const EdgeInsets.only(left: 68.0, right: 68.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacer(flex: 2),
                    welcomeBack,
                    Spacer(flex: 2),
                    loginForm,
                    Spacer(flex: 2),
                    loginButton,
                    Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_onBasicAlertPressed(context) {
  Alert(
    closeIcon: Icon(
      Icons.close,
      color: Theme.of(context).colorScheme.primary,
      size: 24,
    ),
    context: context,
    // title: "SUCCESS",
    // desc: "Pembayaran anda telah berhasil dilakukan",
    content: Column(
      children: [
        Icon(
          (ApiService.bearerToken != '')
              ? Icons.check_circle_outline_rounded
              : Icons.cancel_outlined,
          color: (ApiService.bearerToken != '')
              ? Theme.of(context).colorScheme.primary
              : Colors.red,
          size: 100,
        ),
        Text(
          (ApiService.bearerToken != '') ? 'Berhasil!' : 'Gagal!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        Text(
          (ApiService.bearerToken != '')
              ? 'Anda berhasil login ke aplikasi'
              : 'Anda gagal login ke aplikasi',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    ),
    buttons: (ApiService.bearerToken != '')
        ? List.generate(
            1,
            (index) => DialogButton(
              color: Theme.of(context).colorScheme.primary,
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainPage())),
              child: Text(
                "Kembali ke Beranda",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        : null,
    style: AlertStyle(
      // backgroundColor: Theme.of(context).colorScheme.background,
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      overlayColor: Colors.black,
    ),
  ).show();
}
