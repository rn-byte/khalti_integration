import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'id': '#1101',
      'name': 'Product 1',
      'price': 299.99,
      'image': 'assets/promo-banner-1.png'
    },
    {
      'id': '#1102',
      'name': 'Product 2',
      'price': 499.99,
      'image': 'assets/promo-banner-2.png'
    },
    {
      'id': '#1103',
      'name': 'Product 3',
      'price': 149.99,
      'image': 'assets/promo-banner-3.png'
    },
    {
      'id': '#1104',
      'name': 'Product 4',
      'price': 999.99,
      'image': 'assets/promo-banner-1.png'
    },
  ];

  void onBuyNowPressed(
      String productName, double productPrice, String productIdentity) {
    // Placeholder for payment integration
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
          amount: productPrice.toInt(),
          productIdentity: productIdentity,
          productName: productName),
      preferences: [
        PaymentPreference.connectIPS,
        PaymentPreference.eBanking,
        PaymentPreference.sct,
      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCancel,
    );
    debugPrint("Buy Now pressed for $productName at price $productPrice");
  }

  void onSuccess(PaymentSuccessModel success) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Successful!'),
        actions: [
          SimpleDialogOption(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  void onFailure(PaymentFailureModel success) {}
  void onCancel() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
        backgroundColor: const Color.fromARGB(255, 158, 122, 222),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(product['image']),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Rs. ${product['price'].toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 155, 150, 150),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => onBuyNowPressed(
                          product['name'], product['price'], product['id']),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 181, 147, 243),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
