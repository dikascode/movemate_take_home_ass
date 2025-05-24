import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../controllers/shipment_controller.dart';
import '../main.dart';
import '../widgets/shipment_card.dart';
import '../widgets/shipment_filter_tabs.dart';

class ShipmentHistoryView extends StatefulWidget {
  const ShipmentHistoryView({super.key});

  @override
  State<ShipmentHistoryView> createState() => _ShipmentHistoryViewState();
}

class _ShipmentHistoryViewState extends State<ShipmentHistoryView>
    with TickerProviderStateMixin, RouteAware {
  final controller = ShipmentController();

  int selectedIndex = 0;
  String selectedLabel = 'All';
  bool _visible = false;
  Key _listKey = UniqueKey();

  void runAnimation() {
    setState(() => _visible = false);
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  void initState() {
    super.initState();
    runAnimation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    runAnimation();
    setState(() => _listKey = UniqueKey());
  }

  @override
  Widget build(BuildContext context) {
    final allShipments = controller.getShipments();
    final filteredShipments = selectedLabel == 'All'
        ? allShipments
        : allShipments
            .where((s) =>
                s.status.toLowerCase().replaceAll("-", " ") ==
                selectedLabel.toLowerCase())
            .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Shipment history',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          ShipmentFilterTabs(
            selectedIndex: selectedIndex,
            onTabSelected: (index, label) {
              final isChangingTab = selectedIndex != index;
              setState(() {
                selectedIndex = index;
                selectedLabel = label;
                _listKey = UniqueKey(); // Force rebuild always
              });
              if (isChangingTab) {
                runAnimation(); // Only animate when switching to a new tab
              }
            },
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Shipments',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: filteredShipments.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.local_shipping_outlined,
                            size: 64, color: Colors.deepPurple.shade200),
                        const SizedBox(height: 16),
                        const Text(
                          'No shipments found',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try selecting a different status',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    key: _listKey,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredShipments.length,
                    itemBuilder: (context, index) {
                      final shipment = filteredShipments[index];
                      return Animate(
                        effects: [
                          FadeEffect(duration: 500.ms, delay: (index * 100).ms),
                          SlideEffect(
                            begin: const Offset(0, 0.1),
                            duration: 500.ms,
                            delay: (index * 100).ms,
                            curve: Curves.easeOut,
                          ),
                        ],
                        child: ShipmentCard(shipment: shipment),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
