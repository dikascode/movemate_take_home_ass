import 'package:flutter/material.dart';
import '../controllers/shipment_controller.dart';
import '../widgets/shipment_card.dart';

class ShipmentHistoryView extends StatelessWidget {
  final controller = ShipmentController();

  @override
  Widget build(BuildContext context) {
    final shipments = controller.getShipments();

    return Scaffold(
      appBar: AppBar(title: const Text('Shipment history')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            color: Colors.deepPurple.shade50,
            child: Row(
              children: [
                _tab('All', 12, isSelected: true),
                _tab('Completed', 5),
                _tab('In progress', 3),
                _tab('Pending', 4),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: shipments.length,
              itemBuilder: (context, index) {
                return ShipmentCard(shipment: shipments[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _tab(String title, int count, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.deepPurple : Colors.black,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 3,
              width: 20,
              color: Colors.deepPurple,
            )
        ],
      ),
    );
  }
}
