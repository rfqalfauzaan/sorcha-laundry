import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';

import '../config/app_assets.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
        
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
            headerImage(context),
            Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Order',
                style: TextStyle(height: 1, fontSize: 18),
              ),
            ),
          ),
          DView.spaceHeight(50),
        ],
      ),
    );
  }
}



Widget headerImage(BuildContext context){
  return AspectRatio(
    aspectRatio: 1,
    child: Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          child: Image.asset(
            
            AppAssets.bgShop,
          )
        ),
      ],
    ),
  );
}