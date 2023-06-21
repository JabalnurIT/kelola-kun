import 'package:ecommerce_int2/screens/user/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../api_service.dart';
import 'purchase_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int pageNumber = 0;
  late TabController bottomTabController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 24.0),
        child: Container(
          // padding: EdgeInsets.only(top: 30.0, right: 50.0, left: 50.0),
          child: AppBar(
            // elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            toolbarHeight: 60,
            leadingWidth: 350,
            leading: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back_ios_rounded, size: 24),
                    Image.asset('assets/logo.png'),
                    SizedBox(width: 16),
                    Text(
                      'Kelola-Kun',
                      style: TextStyle(
                        fontSize: 24,
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
                padding: EdgeInsets.only(top: 100, left: 75, right: 75),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: 48,
                                        color: Color(0xFFF5F5F5),
                                      ),
                                      Icon(
                                        Icons.person_pin,
                                        size: 32,
                                        color: Color(0xFF627B87),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Username',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 28),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.person_pin,
                                    size: 28,
                                    color: Color(0xBD000000),
                                  ),
                                  SizedBox(width: 24),
                                  Text(
                                    'My Profile',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => PurchasePage()));
                              },
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.list_alt_rounded,
                                    size: 28,
                                    color: Color(0xBD000000),
                                  ),
                                  SizedBox(width: 24),
                                  Text(
                                    'My Purchase',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.notifications,
                                    size: 28,
                                    color: Color(0xBD000000),
                                  ),
                                  SizedBox(width: 24),
                                  Text(
                                    'Notification',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                    ),
                    Container(
                      width: 920,
                      color: Color(0xFFF5F5F5),
                      padding: EdgeInsets.only(
                          left: 43, right: 150, top: 43, bottom: 93),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 43,
                            height: 43,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 160,
                                  color: Color(0xFFF5F5F5),
                                ),
                                Icon(
                                  Icons.person_pin,
                                  size: 120,
                                  color: Color(0xFF627B87),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 520,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Username',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      width: 340,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Sarah Alisa',
                                          labelStyle: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w300,
                                            // 0.4 of black hexa = 0x66000000
                                            color: Color(0x66000000),
                                          ),
                                        ),
                                        controller: null,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'User ID',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      width: 340,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'KK001',
                                          labelStyle: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w300,
                                            // 0.4 of black hexa = 0x66000000
                                            color: Color(0x66000000),
                                          ),
                                        ),
                                        controller: null,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Color(0xFFDADADA),
                                  thickness: 2.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      width: 340,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'sarah@gmail.com',
                                          labelStyle: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w300,
                                            // 0.4 of black hexa = 0x66000000
                                            color: Color(0x66000000),
                                          ),
                                        ),
                                        controller: null,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Phone Number',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      width: 340,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '081234556790',
                                          labelStyle: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w300,
                                            // 0.4 of black hexa = 0x66000000
                                            color: Color(0x66000000),
                                          ),
                                        ),
                                        controller: null,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Address',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      width: 340,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              'Kejawan Putih Tambak 7 16-1, Kejawaan Putih Tamba Kec. Mulyorejo, Surabaya, Jawa Timur 60112',
                                          labelStyle: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w300,
                                            // 0.4 of black hexa = 0x66000000
                                            color: Color(0x66000000),
                                          ),
                                        ),
                                        controller: null,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
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
