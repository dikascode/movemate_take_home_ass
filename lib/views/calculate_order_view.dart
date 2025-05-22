import 'package:flutter/material.dart';
import '../controllers/order_controller.dart';
import '../widgets/input_field.dart';
import '../widgets/dropdown_selector.dart';

class CalculateOrderView extends StatefulWidget {
  @override
  State<CalculateOrderView> createState() => _CalculateOrderViewState();
}

class _CalculateOrderViewState extends State<CalculateOrderView> {
  final controller = OrderController();
  late List<String> categories;
  late List<String> packagingTypes;
  String selectedPackaging = 'Box';

  @override
  void initState() {
    super.initState();
    categories = controller.getCategories();
    packagingTypes = controller.getPackagingTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculate')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Destination', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: const Column(
                children: [
                  InputField(hintText: 'Sender location', icon: Icons.upload),
                  InputField(hintText: 'Receiver location', icon: Icons.download),
                  InputField(hintText: 'Approx weight', icon: Icons.scale),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Text('Packaging', style: Theme.of(context).textTheme.titleLarge),
            Text('What are you sending?', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            DropdownSelector(
              items: packagingTypes,
              selected: selectedPackaging,
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedPackaging = value);
                }
              },
              leadingIcon: Image.asset(
                'assets/images/box.png',
                height: 50,
                width: 50,
              ),
            ),

            const SizedBox(height: 20),
            Text('Categories\nWhat are you sending?', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: categories.map((cat) => Chip(label: Text(cat))).toList(),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/summary'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: const Text('Calculate', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

}
