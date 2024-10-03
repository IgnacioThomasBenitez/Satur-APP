import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satur_hardware/screens/product_list_screen.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({required this.product}); // Constructor corregido

  @override
  Widget build(BuildContext context) {
    var image = product.image;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            image.isNotEmpty
                ? Image.asset( // Verificación del campo image
                    image,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : SizedBox.shrink(), // No muestra nada si no hay imagen
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product.description,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '\$${product.price.toStringAsFixed(2)}', // Formato de precio
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Agregar al carrito y mostrar un mensaje
                Provider.of<CartProvider>(context, listen: false)
                    .addItem(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.title} agregado al carrito'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Agregar al Carrito'),
            ),
          ],
        ),
      ),
    );
  }
}

extension on CartProvider {
  void addItem(Product product) {}
}
