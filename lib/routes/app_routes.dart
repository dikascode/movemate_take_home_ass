import 'package:flutter/material.dart';
import '../views/home_view.dart';
import '../views/shipment_history_view.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeView(),
  '/history': (context) => ShipmentHistoryView(),
};