import 'package:flutter/material.dart';

import '../models/search_shipment.dart';

class SearchResultItem extends StatelessWidget {
  final SearchShipment shipment;
  final VoidCallback? onTap;

  const SearchResultItem({
    super.key,
    required this.shipment,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.inventory_2, color: Colors.white),
        ),
        title: Text(shipment.title, style: Theme.of(context).textTheme.bodyLarge),
        subtitle: Text(
          '${shipment.id} • ${shipment.route}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
        ),
        onTap: onTap,
      ),
    );
  }
}
