import 'package:flutter/material.dart';
import '../widgets/estimate_summary_card.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 400,
                ),
              ],
            ),

            const SizedBox(height: 16),
            const EstimateSummaryCard(
              amount: '\$1459',
              currency: 'USD',
              description:
              'This amount is estimated and may vary if you change your location or weight.',
              imagePath: 'assets/images/box.png',
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ElevatedButton(
                onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('Back to home', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
