import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';
import '../widgets/tracking_card.dart';
import '../widgets/vehicle_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with TickerProviderStateMixin, RouteAware {
  bool _visible = false;
  Key _listKey = UniqueKey();

  void runAnimation() {
    setState(() => _visible = false);
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
    runAnimation();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    runAnimation();
    setState(() {
      _listKey = UniqueKey();
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          elevation: 8,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: (index) {
            switch (index) {
              case 1:
                Navigator.pushNamed(context, '/calculate');
                break;
              case 2:
                Navigator.pushNamed(context, '/history');
                break;
              case 3:
                Navigator.pushNamed(context, '/search');
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: 'Calculate'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'Shipment'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Animate(
              key: ValueKey('header_$_visible'),
              effects: [
                FadeEffect(duration: 500.ms),
                const SlideEffect(begin: Offset(0, -0.1)),
              ],
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
                color: Colors.deepPurple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on,
                                    size: 16, color: Colors.white),
                                Text('Your location',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white70)),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                SizedBox(width: 4),
                                Text(
                                  'Wertheimer, Illinois',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Icon(Icons.keyboard_arrow_down,
                                    size: 16, color: Colors.white),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 18,
                          child: Icon(Icons.notifications_none_outlined,
                              color: Colors.deepPurple),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.deepPurple),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter the receipt number ...',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.qr_code_scanner,
                                color: Colors.white, size: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_visible)
              Animate(
                key: ValueKey('tracking'),
                effects: [
                  FadeEffect(duration: 600.ms),
                  SlideEffect(begin: const Offset(0, 0.1)),
                ],
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TrackingCard(),
                ),
              ),
            const SizedBox(height: 20),
            Animate(
              key: _listKey,
              effects: [
                FadeEffect(duration: 600.ms),
                const SlideEffect(begin: Offset(0, 0.1)),
              ],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Available vehicles',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          VehicleCard(
                            index: 0,
                            title: 'Ocean freight',
                            subtitle: 'International',
                            asset: 'assets/images/cargo.png',
                          ),
                          VehicleCard(
                            index: 1,
                            title: 'Cargo freight',
                            subtitle: 'Reliable',
                            asset: 'assets/images/truck.png',
                          ),
                          VehicleCard(
                            index: 2,
                            title: 'Air freight',
                            subtitle: 'International',
                            asset: 'assets/images/plane.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
