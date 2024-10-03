import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './product_detail_screen.dart';
import 'package:satur_hardware/providers/cart_provider.dart' as cart;
import 'cart_screen.dart';
import 'package:satur_hardware/models/product.dart';

const Color defaultColor = Color(0xFF3201F5);

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required int size, // Corregido aquí
  });
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
  Product(
    id: '1',
    title: "DVI-HDMI",
    price: 234,
    size: 12,
    description: "Adaptador que permite conectar un dispositivo con salida DVI a un monitor o TV con entrada HDMI.",
    image: "assets/images/DVI-HDMI1.webp",
  ),
  Product(
    id: '2',
    title: "Fuente 500w",
    price: 234,
    size: 8,
    description: "Fuente de alimentación de 500W ideal para equipos de escritorio de alto rendimiento.",
    image: "assets/images/fuente-1.jpg",
  ),
  Product(
    id: '3',
    title: "Impresora 3D",
    price: 234,
    size: 10,
    description: "Impresora 3D de alta precisión para proyectos de modelado y prototipado.",
    image: "assets/images/1.jpg",
  ),
  Product(
    id: '4',
    title: "Parlantes",
    price: 234,
    size: 11,
    description: "Parlantes estéreo con sonido envolvente y bajos profundos.",
    image: "assets/images/parlante1.webp",
  ),
  Product(
    id: '5',
    title: "Placa Madre",
    price: 234,
    size: 12,
    description: "Placa madre compatible con procesadores de última generación.",
    image: "assets/images/placa-1.png",
  ),
  Product(
    id: '6',
    title: "Procesador",
    price: 234,
    size: 12,
    description: "Procesador de 8 núcleos ideal para gaming y tareas de alto rendimiento.",
    image: "assets/images/1.webp",
  ),
  Product(
    id: '7',
    title: "RAM Hyper",
    price: 234,
    size: 12,
    description: "Módulo de memoria RAM de alto rendimiento con 16GB de capacidad.",
    image: "assets/images/ram-1.jpg",
  ),
  Product(
    id: '8',
    title: "SSD",
    price: 234,
    size: 12,
    description: "Disco de estado sólido de 1TB para almacenamiento rápido y confiable.",
    image: "assets/images/ssd-1.png",
  ),
  Product(
    id: '9',
    title: "USB Drive",
    price: 234,
    size: 12,
    description: "Memoria USB de 64GB para almacenamiento portátil.",
    image: "assets/images/USB-1.jpg",
  ),
  Product(
    id: '10',
    title: "Placa de video",
    price: 234,
    size: 12,
    description: "Tarjeta gráfica de última generación con 8GB de memoria GDDR6.",
    image: "assets/images/video-1.jpg",
  ),
    // Agrega más productos aquí
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'Satur',
            style: TextStyle(fontSize: 20),
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart'); // Navegando a la ruta
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, i) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.asset(products[i].image, width: 50, height: 50),
              title: Text(products[i].title),
              subtitle: Text('\$${products[i].price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  // Agregar producto al carrito
                  cartProvider.addToCart(products[i].id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${products[i].title} agregado al carrito'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: products[i]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
}
}
