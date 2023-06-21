import 'package:ecommerce_int2/screens/superAdmin/component/bahan_baku_table.dart';
import 'package:ecommerce_int2/screens/user/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../api_service.dart';
import '../../../models/order.dart';
import 'profile_page.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  int pageNumber = 0;
  late TabController bottomTabController;
  Future<List<Order>>? dataOrder;

  Future<List<Order>> getDataOrder() async {
    return await ApiService().getOrder();
  }

  @override
  void initState() {
    dataOrder = getDataOrder();
    super.initState();
    getDataOrder();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
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
                            SizedBox(height: 28),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ProfilePage()));
                              },
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
                              onPressed: () {},
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
                      width: 1000,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            color: Color(0xFFF5F5F5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    child: Text('All',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    child: Text('To Pay',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    child: Text('To Ship',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    child: Text('To Receive',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    child: Text('Completed',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    child: Text('Cancelled',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Color(0xFFF5F5F5),
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Warehouse Surabaya',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              'Rungkut, Surabaya',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF627B87),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                _onBasicAlertPressed(context);
                                              },
                                              child: Text(
                                                'Shipping Status',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF627B87),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .primary),
                                              ),
                                              child: Text(
                                                'Chat',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Divider(
                                    color: Color(0xFF627B87),
                                    thickness: 2,
                                  ),
                                ),
                                Container(
                                  height: 300,
                                  child: FutureBuilder<List<Order>>(
                                    future: getDataOrder(),
                                    builder: (context, snapshort) {
                                      if (snapshort.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else if (snapshort.hasData) {
                                        List<Order> _order = snapshort.data!;
                                        return Expanded(
                                          child: ListView.builder(
                                            itemBuilder: (context, index) =>
                                                Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 20, bottom: 20),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 20),
                                                            child: Image.asset(
                                                              'assets/producta.png',
                                                              width: 100,
                                                              height: 100,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Gula 20kg, Lemon 2Kg, Kentang 12Kg',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              Text(
                                                                '2 Barang',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                      0xFF627B87),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 20),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Rp100.000',
                                                            style: TextStyle(
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xFF000000),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 20),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Order Total: ',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xFF627B87),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              'Rp300.000',
                                                              style: TextStyle(
                                                                fontSize: 32,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .primary,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 20),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      _onBasicAlertConfirmPressed(
                                                          context);
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary),
                                                    ),
                                                    child: Text(
                                                      'Order Received',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .background,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      } else {
                                        return const Center(
                                            child: Text('There is no data'));
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
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
    closeIcon: null,
    context: context,
    // title: "SUCCESS",
    // desc: "Pembayaran anda telah berhasil dilakukan",
    content: Column(
      children: [
        Column(
          children: [
            Text(
              'Seller - Tue, 18 Apr 2023',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              'Waiting for pick up',
              style: TextStyle(
                color: Color(0xFF627B87),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Text(
              'Seller - Tue, 18 Apr 2023',
              style: TextStyle(
                color: Color(0xFF627B87),
              ),
            ),
            Text(
              'The order is being processed by the seller',
              style: TextStyle(
                color: Color(0xFF627B87),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Text(
              'Kelola-Kun - Tue, 18 Apr 2023',
              style: TextStyle(
                color: Color(0xFF627B87),
              ),
            ),
            Text(
              'Payment has been verified',
              style: TextStyle(
                color: Color(0xFF627B87),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ],
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

_onBasicAlertConfirmPressed(context) {
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
          'Barang Berhasil Dikonfimasi',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
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
