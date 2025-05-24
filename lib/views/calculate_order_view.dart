import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../controllers/order_controller.dart';
import '../widgets/input_field.dart';
import '../widgets/dropdown_selector.dart';
import '../main.dart';

class CalculateOrderView extends StatefulWidget {
  @override
  State<CalculateOrderView> createState() => _CalculateOrderViewState();
}

class _CalculateOrderViewState extends State<CalculateOrderView>
    with TickerProviderStateMixin, RouteAware {
  final controller = OrderController();
  late List<String> categories;
  late List<String> packagingTypes;
  String selectedPackaging = 'Box';
  bool _visible = false;
  int selectedCategoryIndex = -1;

  void runAnimation() {
    setState(() => _visible = false);
    Future.delayed(100.ms, () {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  void initState() {
    super.initState();
    categories = controller.getCategories();
    packagingTypes = controller.getPackagingTypes();
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
  void didPopNext() => runAnimation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          centerTitle: true,
          title: const Text(
          'Calculate',
      style: TextStyle(color: Colors.white),
    ),
    iconTheme: const IconThemeData(
    color: Colors.white,
    ),
    ),
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: AnimatedOpacity(
    opacity: _visible ? 1.0 : 0.0,
    duration: 300.ms,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('Destination', style: Theme.of(context).textTheme.headlineLarge)
        .animate()
        .fade(duration: 300.ms)
        .slideY(begin: -0.1),
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
    InputField(
    hintText: 'Receiver location', icon: Icons.download),
    InputField(hintText: 'Approx weight', icon: Icons.scale),
    ],
    ),
    ).animate(delay: 100.ms).fade().slideY(begin: 0.1),
    const SizedBox(height: 20),
    Text('Packaging', style: Theme.of(context).textTheme.headlineLarge)
        .animate(delay: 200.ms)
        .fade()
        .slideY(begin: 0.1),
    Text('What are you sending?',
    style: Theme.of(context).textTheme.bodyMedium)
        .animate(delay: 250.ms)
        .fade()
        .slideY(begin: 0.1),
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
    ).animate(delay: 300.ms).fade().slideY(begin: 0.1),
    const SizedBox(height: 20),
    Text('Categories',
    style: Theme.of(context).textTheme.headlineLarge)
        .animate(delay: 300.ms)
        .fade()
        .slideY(begin: 0.1),
    Text('What are you sending?',
    style: Theme.of(context).textTheme.bodyMedium)
        .animate(delay: 300.ms)
        .fade()
        .slideY(begin: 0.1),
    const SizedBox(height: 12),
    Wrap(
    spacing: 10,
    runSpacing: 10,
    children: categories.asMap().entries.map((entry) {
    final i = entry.key;
    final cat = entry.value;
    final isSelected = selectedCategoryIndex == i;

    return GestureDetector(
    onTap: () {
    setState(() {
    selectedCategoryIndex = i;
    });
    },
    child: AnimatedContainer(
    duration: 300.ms,
    curve: Curves.easeOut,
    padding: const EdgeInsets.symmetric(
    horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
    color: isSelected ? Colors.deepPurple : Colors.white,
    borderRadius: BorderRadius.circular(10),
    border: isSelected
    ? null
        : Border.all(color: Colors.grey.shade300),
    ),
    child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
    AnimatedSwitcher(
    duration: 200.ms,
    transitionBuilder: (child, anim) =>
    FadeTransition(opacity: anim, child: child),
    child: isSelected
    ? const Padding(
    key: ValueKey(true),
    padding: EdgeInsets.only(right: 6),
    child: Icon(Icons.check,
    size: 16, color: Colors.white),
    )
        : const SizedBox(
    width: 0, key: ValueKey(false)),
    ),
    Text(
    cat,
    style: TextStyle(
    color: isSelected ? Colors.white : Colors.black,
    fontWeight: FontWeight.w500,
    ),
    ),
    ],
    ),
    )
        .animate(delay: (300 + i * 80).ms)
        .fade()
        .slideY(begin: 0.1),
    );
    }).toList(),
    ),
    const SizedBox(height: 80),
    ],
    ),
    ),
    ),
    bottomNavigationBar: Padding(
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
    child: ElevatedButton(
    onPressed: () => Navigator.pushNamed(context, '/summary'),
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,
    minimumSize: const Size.fromHeight(50),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
    ),
    ),
    child: const Text('Calculate', style: TextStyle(color: Colors.white)),
    )
        .animate(delay: 500.ms)
        .fade(duration: 300.ms)
        .slideY(begin: 0.2, curve: Curves.easeOut),
    ),
    );
  }
}
