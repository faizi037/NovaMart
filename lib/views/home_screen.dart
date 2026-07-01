import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('NovaMart'),
        actions: [
          IconButton(
            onPressed: provider.toggleTheme,
            icon: Icon(
              provider.isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
              if (provider.wishlist.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 8,
                    child: Text(
                      provider.wishlist.length.toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
              if (provider.cart.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 8,
                    child: Text(
                      provider.cart.length.toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search products...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: provider.updateSearch,
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  final id = 'product_$index';

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.shopping_bag_outlined),
                      ),
                      title: Text('Product ${index + 1}'),
                      subtitle: const Text(
                        'REST API Product Placeholder',
                      ),
                      trailing: Wrap(
                        spacing: 8,
                        children: [
                          IconButton(
                            onPressed: () {
                              provider.addToWishlist(id);
                            },
                            icon: Icon(
                              provider.isFavorite(id)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              provider.addToCart(id);
                            },
                            icon: Icon(
                              provider.isInCart(id)
                                  ? Icons.shopping_cart
                                  : Icons.add_shopping_cart_outlined,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}