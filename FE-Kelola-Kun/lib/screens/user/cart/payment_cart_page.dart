import 'package:ecommerce_int2/screens/user/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PaymentCartPage extends StatefulWidget {
  @override
  _PaymentCartPageState createState() => _PaymentCartPageState();
}

class _PaymentCartPageState extends State<PaymentCartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 24.0),
          child: Container(
            margin: EdgeInsets.only(top: 30.0, right: 50.0, left: 50.0),
            child: AppBar(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.transparent,
              toolbarHeight: 50,
              leadingWidth: 300,
              leading: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => MainPage()));
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Color(0x00000000),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                child: Row(
                  children: [
                    Image.asset('assets/logo.png'),
                    SizedBox(width: 16),
                    Text(
                      'Kelola-Kun',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Container(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset('assets/bottom_rectangle.png'),
                    Positioned(
                      bottom: 10,
                      child: Text(
                        'Kelola-Kun 2023',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 168, left: 75, right: 75),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Menunggu Pembayaran',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      // full screen width
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/gold.png',
                            width: 300,
                            height: 300,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Lakukan pembayaran sebelum 14.19 WIB ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF627B87),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextButton(
                            onPressed: () => _onBasicAlertPressed(context),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.primary,
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  Size(312, 60)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                              ),
                            ),
                            child: Text(
                              'Cek Status Pembayaran',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
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
          Icons.check_circle_outline_rounded,
          color: Theme.of(context).colorScheme.primary,
          size: 100,
        ),
        Text(
          'Berhasil!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        Text(
          'Pembayaran Terkonfimasi',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    ),
    buttons: List.generate(
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
    ),
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
// make alert widget
