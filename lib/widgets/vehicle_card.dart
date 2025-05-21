import 'package:flutter/material.dart';

class VehicleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String asset;

  const VehicleCard({super.key, 
    required this.title,
    required this.subtitle,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
          const Spacer(),
          Image.asset(asset, height: 60),
        ],
      ),
    );
  }
}
