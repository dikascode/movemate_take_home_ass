import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EstimateSummaryCard extends StatefulWidget {
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
  State<EstimateSummaryCard> createState() => _EstimateSummaryCardState();
}

class _EstimateSummaryCardState extends State<EstimateSummaryCard> {
  double displayedAmount = 0;

  @override
  void initState() {
    super.initState();

    final numericAmount =
        double.tryParse(widget.amount.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0;

    Future.delayed(Duration.zero, () {
      setState(() {
        displayedAmount = numericAmount;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Image.asset(
          widget.imagePath,
          height: 200,
        )
            .animate()
            .scale(
              duration: 900.ms,
              curve: Curves.easeOutBack,
              begin: const Offset(0.8, 0.8),
            )
            .fadeIn(),
        const SizedBox(height: 32),
        Text(
          'Total Estimated Amount',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AnimatedDigitWidget(
              value: displayedAmount.toInt(),
              duration: const Duration(seconds: 1),
              prefix: '\$',
              textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.green,
                  ),
              curve: Curves.easeOut,
              enableSeparator: false,
              fractionDigits: 0,
            ),
            const SizedBox(width: 6),
            Text(
              widget.currency,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.green,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            widget.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
