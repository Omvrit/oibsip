import 'package:farmpure/features/onboarding_page/ui/login.dart';
import 'package:farmpure/features/order_page/ui/orders_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 60,
                foregroundImage: NetworkImage(
                    'data:image/jpeg;base64,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'),
              ),
            ),
          ),
          Center(
            child: Text(
              "Om vrit",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Center(
            child: Text(
              "omvritoo@gmail.com",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 25),
          ListTile(
            title: const Text("My orders"),
            leading: const Icon(Icons.shopping_bag),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersPage(),
                  ));
            },
          ),
          ListTile(
            title: const Text("About us"),
            leading: const Icon(Icons.info),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.logout),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
            },
          ),
        ],
      ),
    );
  }
}
