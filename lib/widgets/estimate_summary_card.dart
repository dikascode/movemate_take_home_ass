import 'package:flutter/material.dart';

class EstimateSummaryCard extends StatelessWidget {
  final String amount;
  final String currency;
  final String description;
  final String imagePath;

  const EstimateSummaryCard({
    required this.amount,
    this.currency = 'USD',
    required this.description,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Image.asset(
          imagePath,
          height: 200,
        ),
        const SizedBox(height: 32),
        Text(
          'Total Estimated Amount',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          '$amount $currency',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
