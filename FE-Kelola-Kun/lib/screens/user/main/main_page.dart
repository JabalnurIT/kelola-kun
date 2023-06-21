import 'package:ecommerce_int2/api_service.dart';
import 'package:ecommerce_int2/custom_background.dart';
import 'package:ecommerce_int2/screens/auth/welcome_back_page.dart';
import 'package:ecommerce_int2/screens/user/cart/cart_page.dart';
import 'package:ecommerce_int2/screens/user/product/product_page.dart';
import 'package:ecommerce_int2/screens/not_found_page.dart';
import 'package:ecommerce_int2/screens/user/profile/profile_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

List<String> timelines = ['Weekly featured', 'Best of June', 'Best of 2018'];
String selectedTimeline = 'Weekly featured';

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
  late TabController tabController;
  late TabController bottomTabController;
  int pageNumber = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    bottomTabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget? appBar = PreferredSize(
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
              setState(() {
                pageNumber = 0;
              });
              bottomTabController.animateTo(pageNumber);
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          pageNumber = 1;
                        });
                        bottomTabController.animateTo(pageNumber);
                      },
                      child: Text(
                        'Product',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: (pageNumber != 3)
                              ? Theme.of(context).colorScheme.background
                              : Color(0xFF627B87),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: (pageNumber != 3)
                              ? Theme.of(context).colorScheme.background
                              : Color(0xFF627B87),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          pageNumber = 3;
                        });
                        bottomTabController.animateTo(pageNumber);
                      },
                      child: Text(
                        'Cart',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: (pageNumber != 3)
                              ? Theme.of(context).colorScheme.background
                              : Color(0xFF627B87),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    (ApiService.bearerToken == '')
                        ? TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Theme.of(context).colorScheme.primary),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Sesuaikan dengan radius yang diinginkan
                                ),
                              ),
                            ),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => WelcomeBackPage())),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 21.0,
                                // vertical: 6.0,
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                              ),
                            ),
                          )
                        : TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => ProfilePage())),
                            child: Text(
                              'Profil',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: (pageNumber != 3)
                                    ? Theme.of(context).colorScheme.background
                                    : Color(0xFF627B87),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    Widget topHeader = Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/blob.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Container(
          // height: 800,
          margin: EdgeInsets.only(top: 300, left: 117, right: 117, bottom: 150),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Kelola-Kun',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      fontSize: 64.0),
                ),
                Text(
                  'Supply Chain',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      fontSize: 64.0),
                ),
                SizedBox(height: 73.0),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).colorScheme.primary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Sesuaikan dengan radius yang diinginkan
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26.0,
                      vertical: 19.0,
                    ),
                    child: Text(
                      'Lihat Produk',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    Widget explorer = Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Explore Our Warehouse',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 64.0),
          ),
          SizedBox(height: 54.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Ink(
                  width: 345,
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/warehouse-surabaya.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Surabaya',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 90.0),
              TextButton(
                onPressed: () {},
                child: Ink(
                  width: 345,
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/warehouse-malang.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Malang',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 90.0),
              TextButton(
                onPressed: () {},
                child: Ink(
                  width: 345,
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/warehouse-sidoarjo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sidoarjo',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    Widget partners = Padding(
      padding: const EdgeInsets.only(top: 125),
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.background
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              width: double.infinity,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Our Partners',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 64.0),
                ),
              ),
            ),
            SizedBox(height: 54.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Ink(
                      width: 275,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage('assets/warehouse-surabaya.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Surabaya',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.0),
                  TextButton(
                    onPressed: () {},
                    child: Ink(
                      width: 275,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage('assets/warehouse-malang.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Malang',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.0),
                  TextButton(
                    onPressed: () {},
                    child: Ink(
                      width: 275,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage('assets/warehouse-sidoarjo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Sidoarjo',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.0),
                  TextButton(
                    onPressed: () {},
                    child: Ink(
                      width: 275,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage('assets/warehouse-sidoarjo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Sidoarjo',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120.0,
            ),
          ],
        ),
      ),
    );

    Widget supply = Column(
      children: [
        Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Best Supply Marketplace',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.w600,
                    fontSize: 64.0),
              ),
              SizedBox(height: 54.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 370,
                            height: 414,
                            child: Column(
                              children: [
                                Ink(
                                  width: 370,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/vegetables.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non mollis urna.',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 100.0),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 370,
                            height: 414,
                            child: Column(
                              children: [
                                Ink(
                                  width: 370,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: AssetImage('assets/syal.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non mollis urna.',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 100.0),
                    Row(
                      children: [
                        TextButton(
                          // onPressed: () => Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (_) => NotificationsPage())),
                          onPressed: () {},
                          child: Container(
                            width: 370,
                            height: 414,
                            child: Column(
                              children: [
                                Ink(
                                  width: 370,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: AssetImage('assets/cloth.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non mollis urna.',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Stack(
                children: [
                  Container(
                    height: 200,
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      image: DecorationImage(
                        image: AssetImage('assets/wave.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) =>
                                Theme.of(context).colorScheme.background),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Sesuaikan dengan radius yang diinginkan
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26.0,
                          vertical: 19.0,
                        ),
                        child: Text(
                          'Lihat Produk',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50.0,
                color: Theme.of(context).colorScheme.background,
              ),
            ],
          ),
        ),
      ],
    );

    Widget about = Container(
      width: double.infinity,
      height: 280,
      color: Theme.of(context).colorScheme.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 506,
            child: Column(
              children: [
                Container(
                  height: 88,
                  child: Row(
                    children: [
                      Image.asset('assets/logo.png', width: 64, height: 64),
                      SizedBox(width: 16),
                      Text(
                        'Kelola-Kun',
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non mollis urna.',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 90.0),
          Container(
            width: 506,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Ingin menjadi mitra kami?',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                Container(
                  height: 36,
                  child: Row(
                    children: [
                      SizedBox(width: 200),
                      Icon(
                        Icons.mail_outline_rounded,
                        size: 30,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: 16),
                      Text(
                        'contact@kelolakun.com',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 36,
                  child: Row(
                    children: [
                      SizedBox(width: 200),
                      Icon(
                        Icons.phone,
                        size: 30,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: 16),
                      Text(
                        '+62 812 xxxx xxxx',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: CustomPaint(
        painter: MainBackground(),
        child: TabBarView(
          controller: bottomTabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            SizedBox(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  // These are the slivers that show up in the "outer" scroll view.
                  return <Widget>[
                    SliverToBoxAdapter(
                      child: topHeader,
                    ),
                    // SliverToBoxAdapter(
                    //   child: explorer,
                    // ),
                  ];
                },
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      explorer,
                      partners,
                      supply,
                      about,
                    ],
                  ),
                ),
              ),
            ),
            ProductPage(),
            NotFoundPage(),
            CartPage()
          ],
        ),
      ),
    );
  }
}
