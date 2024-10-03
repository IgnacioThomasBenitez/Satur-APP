import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, int> _cartItems = {};
  List<Product> _products = []; // Almacenar los productos

  // Método para establecer los productos
  void setProducts(List<Product> products) {
    _products = products; // Cambia la implementación para almacenar productos directamente
    notifyListeners();
  }

  // Método para agregar un producto al carrito
  void addToCart(String productId) {
    // Verifica que el producto exista
    if (_products.any((p) => p.id == productId)) { 
      if (_cartItems.containsKey(productId)) {
        _cartItems[productId] = _cartItems[productId]! + 1; // Incrementar cantidad
      } else {
        _cartItems[productId] = 1; // Agregar nuevo producto
      }
      notifyListeners();
    } else {
      print('El producto con ID $productId no existe.'); // Manejo de errores
    }
  }

  // Método para eliminar un producto del carrito
  void removeFromCart(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.remove(productId); // Eliminar producto
      notifyListeners();
    }
  }

  // Método para obtener el total del carrito
  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((key, quantity) {
      // Busca el producto y maneja el caso en que no se encuentre
      final product = _products.firstWhere(
        (p) => p.id == key,
        orElse: () => throw Exception('Producto no encontrado: ID $key'),
      );
      total += quantity * product.price; // Calcular el total
    });
    return total;
  }

  // Getter para obtener los elementos del carrito
  Map<String, int> get cartItems => _cartItems;

  // Getter para obtener la lista de productos
  List<Product> get products => _products; 
}
