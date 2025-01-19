import 'package:bagisimpen/model/cart_model.dart';
import 'package:bagisimpen/core/theme/color.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final List<CartItem> cartItems = [
    CartItem(
      name: "Beras Pak Simpen",
      imagePath: "assets/images/mainsale/mainsale1.jpeg",
      price: 75900,
    ),
    CartItem(
      name: "Sabun Cuci Piring Dan Wajah",
      imagePath: "assets/images/mainsale/mainsale5.jpeg",
      price: 12200,
    ),
    CartItem(
      name: "Kopi Arya \"Kopinya para Arya\"",
      imagePath: "assets/images/mainsale/mainsale6.jpeg",
      price: 8200,
    ),
  ];

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  cartItem: cartItems[index],
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      cartItems[index].quantity = newQuantity;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                child: Text(
                  "Checkout - Rp ${totalPrice.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final ValueChanged<int> onQuantityChanged;

  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                cartItem.imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Rp ${cartItem.price.toStringAsFixed(0)}",
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (cartItem.quantity > 1) {
                      onQuantityChanged(cartItem.quantity - 1);
                    }
                  },
                  icon: const Icon(Icons.remove_circle_outline, color: Colors.green, size: 28),
                ),
                Text(
                  "${cartItem.quantity}",
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    onQuantityChanged(cartItem.quantity + 1);
                  },
                  icon: const Icon(Icons.add_circle_outline, color: Colors.green, size: 28),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
