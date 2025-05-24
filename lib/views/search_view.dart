import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/search_shipment.dart';
import '../widgets/search_result_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  bool _visible = false;

  final List<SearchShipment> shipments = [
    SearchShipment(
        title: 'Macbook pro M2',
        id: '#NE43857340857904',
        route: 'Paris → Morocco'),
    SearchShipment(
        title: 'Summer linen jacket',
        id: '#NEJ20089934122231',
        route: 'Barcelona → Paris'),
    SearchShipment(
        title: 'Tapered-fit jeans AW',
        id: '#NEJ35870264978659',
        route: 'Colombia → Paris'),
    SearchShipment(
        title: 'Slim fit jeans AW',
        id: '#NEJ35870264978659',
        route: 'Bogota → Dhaka'),
    SearchShipment(
        title: 'Office setup desk',
        id: '#NEJ23481570754963',
        route: 'France → German'),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(100.ms, () => setState(() => _visible = true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios,
                      color: Colors.white, size: 20),
                )
                    .animate()
                    .slideX(
                        begin: -1.0,
                        end: 0.0,
                        duration: 400.ms,
                        curve: Curves.easeOut)
                    .fade(),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.deepPurple),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            controller: _controller,
                            decoration: const InputDecoration(
                              hintText: 'Enter the receipt number...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.qr_code_scanner,
                              color: Colors.white, size: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ListView.builder(
                itemCount: shipments.length,
                itemBuilder: (context, index) {
                  final shipment = shipments[index];
                  return SearchResultItem(
                    shipment: shipment,
                    onTap: () {},
                  )
                      .animate()
                      .fade(duration: 400.ms, delay: (index * 80).ms)
                      .slideX(begin: 0.2);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
