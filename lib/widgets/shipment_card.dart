import 'package:flutter/material.dart';
import '../models/shipment.dart';

class ShipmentCard extends StatelessWidget {
  final Shipment shipment;

  const ShipmentCard({required this.shipment});

  @override
  Widget build(BuildContext context) {
    final statusColors = {
      'in-progress': Colors.green,
      'pending': Colors.orange,
      'loading': Colors.blue,
    };

    final statusAssetPath = {
      'in-progress': 'assets/images/in_progress.png',
      'pending': 'assets/images/pending.png',
      'loading': 'assets/images/loading.png',
    };

    final color = statusColors[shipment.status] ?? Colors.grey;
    final assetPath = statusAssetPath[shipment.status];

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          assetPath!,
                          width: 16,
                          height: 16
                        ),
                        const SizedBox(width: 8),
                        Text(
                          shipment.status,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ),
                  const SizedBox(height: 8),
                  Text(shipment.title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(shipment.description, style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 8),
                  Text(shipment.price, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                  Text(shipment.date, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Image.asset('assets/images/box.png', width: 100, height: 100,),
          ],
        ),
      ),
    );
  }
}
