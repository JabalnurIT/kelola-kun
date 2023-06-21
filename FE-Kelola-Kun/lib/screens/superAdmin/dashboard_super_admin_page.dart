import 'package:ecommerce_int2/screens/superAdmin/component/bahan_baku_table.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sidebarx/sidebarx.dart';

void main() {
  runApp(DashboardSuperAdminPage());
}

class DashboardSuperAdminPage extends StatelessWidget {
  DashboardSuperAdminPage({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SidebarX Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.black,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: backgroundColor,
                    title: Text(_getTitleByIndex(_controller.selectedIndex)),
                    leading: IconButton(
                      onPressed: () {
                        // if (!Platform.isAndroid && !Platform.isIOS) {
                        //   _controller.setExtended(true);
                        // }
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                Expanded(
                  child: Center(
                    child: _ScreensExample(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Color(0xFF7C7C7C)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, Color(0xFF079AE1)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF7C7C7C),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: extended ? 120 : 80,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: extended
                ? Column(
                    children: [
                      Image.asset('assets/logo.png', width: 40),
                      SizedBox(height: 5),
                      Text(
                        'Kelola-Kun',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Image.asset('assets/logo.png', width: 40),
                    ],
                  ),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home_outlined,
          label: 'Dashboard',
          onTap: () {
            debugPrint('Dashboard');
          },
        ),
        const SidebarXItem(
          icon: Icons.shopping_cart_outlined,
          label: 'Bahan Baku',
        ),
        const SidebarXItem(
          icon: Icons.add_box,
          label: 'Product',
        ),
        const SidebarXItem(
          icon: Icons.house_siding_outlined,
          label: 'Warehouse',
        ),
        const SidebarXItem(
          icon: Icons.car_rental_outlined,
          label: 'Orders',
        ),
        const SidebarXItem(
          icon: Icons.person_4_outlined,
          label: 'Supplier',
        ),
        const SidebarXItem(
          icon: Icons.person_pin_circle_outlined,
          label: 'Customer',
        ),
        const SidebarXItem(
          icon: Icons.settings_outlined,
          label: 'Setting',
        ),
      ],
      footerItems: [
        const SidebarXItem(
          icon: Icons.person_outline_sharp,
          label: 'User',
        ),
        const SidebarXItem(
          icon: Icons.logout_outlined,
          label: 'Logout',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
          case 1:
            return BahanBakuTable();
          // case 1:
          //   return ListView.builder(
          //     padding: const EdgeInsets.only(top: 10),
          //     itemBuilder: (context, index) => Container(
          //       height: 100,
          //       width: double.infinity,
          //       margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20),
          //         color: Color(0xFF7C7C7C),
          //         boxShadow: const [BoxShadow()],
          //       ),
          //     ),
          //   );

          case 2:
            return BahanBakuTable();
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Dashboard';
    case 1:
      return 'Bahan Baku';
    case 2:
      return 'Product';
    case 3:
      return 'Warehouse';
    case 4:
      return 'Orders';
    case 5:
      return 'Supplier';
    case 6:
      return 'Costumer';
    case 7:
      return 'Setting';
    case 8:
      return 'User';
    case 9:
      return 'Logout';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF076AE1);
const canvasColor = Color(0xFFFFFFFF);
const backgroundColor = Color(0xFF7C7C7C);
const scaffoldBackgroundColor = Color(0xFFF7F7F7);
const accentCanvasColor = Color(0xFF076AE1);
const white = Colors.white;
final actionColor = const Color(0xFF076AE1);
final divider = Divider(color: Color(0xFF7C7C7C), height: 1);
