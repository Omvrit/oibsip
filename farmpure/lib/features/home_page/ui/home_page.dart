import 'package:badges/badges.dart' as badges;
import 'package:farmpure/features/cart_page/ui/cart_page.dart';
import 'package:farmpure/features/explore_page/ui/explore_page.dart';
import 'package:farmpure/features/my_services/ui/my_services.dart';
import 'package:farmpure/features/profile_page/ui/profile_page.dart';
import 'package:farmpure/features/services_page/ui/services_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../backend_services/retrieve_product/retrieve_product.dart';
import '../../../data/products.dart';

class HomePage extends StatefulWidget {
  final UserCredential userCredential;

  HomePage(this.userCredential, {super.key});

  @override
  State<HomePage> createState() => _HomePageState(userCredential);
}

class _HomePageState extends State<HomePage> {
  UserCredential userCredential;
  late List<Widget> pages;

  _HomePageState(this.userCredential) {
    pages = [
      ExplorePage(userCredential),
      const ServicesPage(),
      MyServices(),
      const CartPage(),
      const ProfilePage(),
    ];
  }

  int currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (userCredential.user == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        key: _scaffoldKey,
        drawer: const Drawer(),
        appBar: AppBar(
          centerTitle: false,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, Om vrit 👋",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Enjoy our services",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: badges.Badge(
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
                badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Theme.of(context).primaryColor),
                child: const Icon(Icons.notifications),
              ),
            ),
          ],
        ),
        body: IndexedStack(
          index: currentPageIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentPageIndex,
          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.design_services),
              label: "Services",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business_center),
              label: "My Services",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      );
    }
  }
}