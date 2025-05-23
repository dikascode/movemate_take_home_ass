import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class VehicleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String asset;
  final int index;

  const VehicleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.asset,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      key: ValueKey(
          'vehicle_card_$index${DateTime.now().millisecondsSinceEpoch}'),
      effects: [
        FadeEffect(duration: 600.ms, delay: (index * 100).ms),
        SlideEffect(
            begin: const Offset(0.3, 0),
            curve: Curves.easeOut,
            delay: (index * 100).ms),
      ],
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Animate(
              effects: [
                FadeEffect(duration: 400.ms, delay: (index * 100).ms),
                SlideEffect(
                    begin: const Offset(0.2, 0), delay: (index * 100).ms),
              ],
              child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
            ),
            Animate(
              effects: [
                FadeEffect(duration: 400.ms, delay: (index * 100 + 100).ms),
                SlideEffect(
                    begin: const Offset(0.2, 0), delay: (index * 100 + 100).ms),
              ],
              child: Text(subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      )),
            ),
            const Spacer(),
            Animate(
              effects: [
                FadeEffect(duration: 400.ms, delay: (index * 100 + 200).ms),
                SlideEffect(
                    begin: const Offset(0.3, 0), delay: (index * 100 + 200).ms),
              ],
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(asset, width: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
