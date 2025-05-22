import 'package:flutter/material.dart';
import '../widgets/vehicle_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
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
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calculate'),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: 'Shipment'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  const SizedBox(width: 8),
                  const Text('Your location'),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the receipt number ...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.shopping_basket),
                  filled: true,
                  fillColor: Colors.deepPurple.shade50,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 20),
              Text('Tracking', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shipment Number"),
                          Text("NEJ20089934122231"),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sender: Atlanta, 5243"),
                          Text("Time: 2 day -3 days"),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Receiver: Chicago, 6342"),
                          Text("Status: Waiting to collect"),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text("+ Add Stop", style: TextStyle(color: Colors.orange)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text('Available vehicles', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    VehicleCard(title: 'Ocean freight', subtitle: 'International', asset: 'assets/images/cargo.png'),
                    VehicleCard(title: 'Cargo freight', subtitle: 'Reliable', asset: 'assets/images/truck.png'),
                    VehicleCard(title: 'Air freight', subtitle: 'International', asset: 'assets/images/plane.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
