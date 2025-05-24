import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShipmentFilterTabs extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index, String label) onTabSelected;

  const ShipmentFilterTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {'label': 'All', 'count': 12},
      {'label': 'Completed', 'count': 0},
      {'label': 'In progress', 'count': 3},
      {'label': 'Pending', 'count': 4},
      {'label': 'Cancelled', 'count': 0},
    ];

    return Animate(
      effects: const [
        FadeEffect(duration: Duration(milliseconds: 500)),
        SlideEffect(begin: Offset(0, -0.1)),
      ],
      child: Container(
        height: 56,
        color: Colors.deepPurple,
        padding: EdgeInsets.zero,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tabs.length,
          itemBuilder: (_, index) {
            final tab = tabs[index];
            final String label = tab['label'] as String;
            final int count = tab['count'] as int;
            final bool isSelected = index == selectedIndex;

            return GestureDetector(
              onTap: () => onTabSelected(index, label),
              child: IntrinsicWidth(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            label,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.orange
                                  : Colors.deepPurple.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '$count',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      if (isSelected)
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
