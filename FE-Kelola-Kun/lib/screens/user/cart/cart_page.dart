import 'package:ecommerce_int2/screens/user/cart/checkout_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
              padding:
                  EdgeInsets.only(top: 168, left: 75, right: 75, bottom: 220),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 840,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cart',
                          style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (bool? value) {
                                setState(() {});
                              },
                            ),
                            Text(
                              'Select All',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF627B87),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color(0xFFDADADA),
                          thickness: 8.0,
                        ),
                        Column(
                          children: [
                            ProductList(),
                            ProductList(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    width: 400,
                    padding: EdgeInsets.all(34.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ringkasan Belanja',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Paket A',
                                      style: TextStyle(
                                        color: Color(0xFF627B87),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      'Rp200.000',
                                      style: TextStyle(
                                        color: Color(0xFF627B87),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Paket B',
                                      style: TextStyle(
                                        color: Color(0xFF627B87),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      'Rp200.000',
                                      style: TextStyle(
                                        color: Color(0xFF627B87),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
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
                                      'Total Harga',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    Text(
                                      'Rp200.000',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckoutPage()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.primary,
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  Size(200, 60)),
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
                              'Beli',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 274,
      child: Column(children: [
        Container(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Image.asset(
                      'assets/producta.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Paket A',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Gula 20 Kg',
                                style: TextStyle(
                                  color: Color(0xFF627B87),
                                ),
                              ),
                              Text(
                                'Lemon 2 Kg',
                                style: TextStyle(
                                  color: Color(0xFF627B87),
                                ),
                              ),
                              Text(
                                'Kentang 12 Kg',
                                style: TextStyle(
                                  color: Color(0xFF627B87),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Rp100.000',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      // Add your button action here
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Color(0xFF627B87),
                    ),
                    label: Text(
                      'Hapus dari keranjang',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 615,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Tulis catatan',
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Container(
              width: 131,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {},
                    color: Color(0xFF627B87),
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                      color: Color(0xFF627B87),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                    color: Color(0xFF627B87),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          color: Color(0xFFDADADA),
          thickness: 2.0,
        ),
      ]),
    );
  }
}
