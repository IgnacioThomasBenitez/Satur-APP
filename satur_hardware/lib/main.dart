import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/product_list_screen.dart';
import './screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get yourProductList => null;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CartProvider()..setProducts(yourProductList),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SATUR "Venta de Hardware"',
        home: ProductListScreen(),
        routes: {
          '/cart': (ctx) => CartScreen(),
        },
      ),
    );
  }
  
  CartScreen() {}
}

extension on CartProvider {
  setProducts(yourProductList) {}
}
