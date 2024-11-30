import 'package:farmpure/widgets/cart_item.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class CartItems{
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String image;
  final String description;

  CartItems({
    required this.description,
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
  });

}

class _CartPageState extends State<CartPage> {


  @override
  void initState() {
    // product = [
    //   Prod(
    //     id: "1",
    //     name: "Tractor",
    //     description:
    //         "Exigence the power of modern farming with our robust tractor. Whether you're tending to vast fields or small plots, this versatile machine ensures efficiency and precision. Its ergonomic design and advanced features make it a must-have for any farmer.",
    //     image: 'assets/tractor.jpg',
    //     price: 377.00,
    //     unit: 'day(s)',
    //     rating: 4.35,
    //     quantity: 2,
    //   ),
    //   Prod(
    //     id: "2",
    //     name: "Fresh Fruits",
    //     description:
    //         "Indulge in the natural sweetness and goodness of our handpicked assortment of fresh fruits. Bursting with flavors and packed with nutrients, these delectable treats are ect for snacking, cooking, or adding a vibrant touch to your meals.",
    //     image: 'assets/fruit.jpg',
    //     price: 9.99,
    //     unit: 'kg',
    //     rating: 3.86,
    //     quantity: 4,
    //   ),
    //   Prod(
    //     id: "3",
    //     name: "Gardener's Rake",
    //     description:
    //         "Maintain a pristine garden with our high-quality gardener's rake. Its sturdy build and well-designed tines make it easy to gather leaves, debris, and soil efficiently. Whether you're a seasoned gardener or just starting out, this tool is a reliable companion.",
    //     image: 'assets/rake.jpg',
    //     price: 8.44,
    //     unit: 'piece',
    //     rating: 4.18,
    //     quantity: 5,
    //   ),
    //   Prod(
    //     id: "4",
    //     name: "Premium Seeds",
    //     description:
    //         "Embark on a journey of cultivation with our premium seeds collection. From vibrant flowers to nutritious vegetables, these carefully selected seeds promise a bountiful and thriving garden. Nurture your green thumb with the best nature has to offer.",
    //     image: 'assets/seeds.jpg',
    //     price: 14.52,
    //     unit: 'kg',
    //     rating: 5.0,
    //     quantity: 5,
    //   ),
    //   Prod(
    //     id: "5",
    //     name: "Sturdy Shovel",
    //     description:
    //         "Conquer your landscaping and gardening tasks with our durable and versatile shovel. Built to withstand demanding work, its ergonomic handle and robust blade make digging, lifting, and moving materials a breeze. Elevate your outdoor projects with this essential tool.",
    //     image: 'assets/shovel.jpg',
    //     price: 14.77,
    //     unit: 'piece',
    //     rating: 5.0,
    //     quantity: 3,
    //   ),
    //   Prod(
    //     id: "6",
    //     name: "Juicy Tomatoes",
    //     description:
    //         "Add a pop of color and flavor to your dishes with our juicy tomatoes. Grown with care, these plump and succulent tomatoes are a kitchen staple. Whether you're making sauces, salads, or sandwiches, these tomatoes are the key to culinary delight.",
    //     image: 'assets/tomato.jpg',
    //     price: 6.84,
    //     unit: 'kg',
    //     rating: 3.22,
    //     quantity: 8,
    //   ),
    // ];
  }

  final cartItems = [
    CartItems(
      id: "1",
      name: "Tractor",
      description:
          "Exigence the power of modern farming with our robust tractor. Whether you're tending to vast fields or small plots, this versatile machine ensures efficiency and precision. Its ergonomic design and advanced features make it a must-have for any farmer.",
      price: 377.00,
      quantity: 2,
      image: 'assets/tractor.jpg',
    ),
    CartItems(
      id: "2",
      name: "Fresh Fruits",
      description:
          "Indulge in the natural sweetness and goodness of our handpicked assortment of fresh fruits. Bursting with flavors and packed with nutrients, these delectable treats are ect for snacking, cooking, or adding a vibrant touch to your meals.",
      price: 9.99,
      quantity: 4,
      image: 'assets/fruit.jpg',
    ),
    CartItems(
      id: "3",
      name: "Gardener's Rake",
      description: "Maintain a pristine garden with our high-quality gardener's rake. Its sturdy build and well-designed tines make it easy to gather leaves, debris, and soil efficiently. Whether you're a seasoned gardener or just starting out, this tool is a reliable companion.",
      price: 8.44,

      quantity: 5,
      image: 'assets/rake.jpg',
    ),
    CartItems(
      id: "4",
      name: "Premium Seeds",
      description: "Embark on a journey of cultivation with our premium seeds collection. From vibrant flowers to nutritious vegetables, these carefully selected seeds promise a bountiful and thriving garden. Nurture your green thumb with the best nature has to offer.",
      price: 14.52,

      quantity: 5,
      image: 'assets/seeds.jpg',
    ),
    CartItems(
      id: "5",
      name: "Sturdy Shovel",
      description: "Conquer your landscaping and gardening tasks with our durable and versatile shovel. Built to withstand demanding work, its ergonomic handle and robust blade make digging, lifting, and moving materials a breeze. Elevate your outdoor projects with this essential tool.",
      price: 14.77,
      quantity: 3,
      image: 'assets/shovel.jpg',
    ),
    CartItems(
      id: "6",
      name: "Juicy Tomatoes",
      description: "Add a pop of color and flavor to your dishes with our juicy tomatoes. Grown with care, these plump and succulent tomatoes are a kitchen staple. Whether you're making sauces, salads, or sandwiches, these tomatoes are the key to culinary delight.",
      price: 6.84,
      quantity: 8,
      image: 'assets/tomato.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final total = cartItems
        .map((cartItem) => cartItem.price)
        .reduce((value, element) => value + element)
        .toStringAsFixed(2);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...List.generate(
              cartItems.length,
              (index) {
                final cartItem = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: CartItem(cartItem: cartItem),
                );
              },
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total (${cartItems.length} items)"),
                Text(
                  "\$$total",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {},
                label: const Text("Proceed to Checkout"),
                icon: const Icon(Icons.arrow_right),
              ),
            )
          ],
        ),
      ),
    );
  }
}
