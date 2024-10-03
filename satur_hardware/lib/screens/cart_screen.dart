import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, int> _cartItems = {}; // Mapa de ID de productos y cantidades
  List<Product> _products = []; // Lista de productos disponibles

  Map<String, int> get cartItems => _cartItems;
  List<Product> get products => _products;

  // Método para cargar los productos disponibles
  void loadProducts(List<Product> availableProducts) {
    _products = availableProducts;
    notifyListeners();
  }

  // Método para agregar productos al carrito
  void addToCart(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems[productId] = _cartItems[productId]! + 1; // Incrementar cantidad si ya está en el carrito
    } else {
      _cartItems[productId] = 1; // Agregar con cantidad 1 si no está en el carrito
    }
    notifyListeners();
  }

  // Método para eliminar productos del carrito
  void removeFromCart(String productId) {
    if (_cartItems.containsKey(productId)) {
      if (_cartItems[productId]! > 1) {
        _cartItems[productId] = _cartItems[productId]! - 1; // Disminuir cantidad
      } else {
        _cartItems.remove(productId); // Remover completamente si la cantidad es 1
      }
    }
    notifyListeners();
  }

  // Método para obtener el total a pagar
  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((productId, quantity) {
      final product = _products.firstWhere((prod) => prod.id == productId);
      total += product.price * quantity;
    });
    return total;
  }

  // Método para vaciar el carrito después de la compra
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
