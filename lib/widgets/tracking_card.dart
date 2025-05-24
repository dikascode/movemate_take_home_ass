import 'package:flutter/material.dart';

class TrackingCard extends StatelessWidget {
  const TrackingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tracking', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shipment Number",
                            style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 4),
                        Text(
                          "NEJ20089934122231",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/tractor.png',
                    height: 40,
                    width: 40,
                  )
                ],
              ),
              const Divider(height: 30),
              const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: _IconText(
                      icon: 'assets/images/outgoing.png',
                      title: 'Sender',
                      subtitle: 'Atlanta, 5243',
                      iconBgColor: Colors.pink,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _GreenDotText(
                        title: 'Time',
                        subtitle: '2 day -3 days',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: _IconText(
                      icon: 'assets/images/incoming.png',
                      title: 'Receiver',
                      subtitle: 'Chicago, 6342',
                      iconBgColor: Colors.greenAccent,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _PlainTextBlock(
                        title: 'Status',
                        subtitle: 'Waiting to collect',
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 30),
              Text(
                '+ Add Stop',
                style: TextStyle(
                  color: Colors.orange.shade800,
                  fontWeight: FontWeight.w600,
                  fontSize: 16
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IconText extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final Color iconBgColor;

  const _IconText({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconBgColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: iconBgColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(6),
          child: Image.asset(icon, height: 25, width: 25),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 2),
            Text(subtitle,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}

class _GreenDotText extends StatelessWidget {
  final String title;
  final String subtitle;

  const _GreenDotText({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey, fontFamily: 'Inter')),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.circle, color: Colors.green, size: 10),
            const SizedBox(width: 4),
            Text(subtitle,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily:  'Inter')),
          ],
        ),
      ],
    );
  }
}

class _PlainTextBlock extends StatelessWidget {
  final String title;
  final String subtitle;

  const _PlainTextBlock({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey, fontFamily: 'Inter')),
        const SizedBox(height: 4),
        Text(subtitle,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Inter')),
      ],
    );
  }
}
