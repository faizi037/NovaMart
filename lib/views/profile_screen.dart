import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';








class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Demo User',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'demo@novamart.com',
            ),

            const SizedBox(height: 30),

            ListTile(
              leading: const Icon(Icons.favorite_outline),
              title: const Text('Wishlist'),
              trailing: Text(
                provider.wishlist.length.toString(),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.shopping_cart_outlined),
              title: const Text('Shopping Cart'),
              trailing: Text(
                provider.cart.length.toString(),
              ),
            ),

            const Divider(),

            SwitchListTile(
              value: provider.isDarkMode,
              onChanged: (value) {
                provider.toggleTheme();
              },
              title: const Text('Dark Mode'),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  provider.logout();
                  Navigator.pop(context);
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}