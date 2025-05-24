import 'package:flutter/material.dart';
import '../views/calculate_order_view.dart';
import '../views/home_view.dart';
import '../views/search_view.dart';
import '../views/shipment_history_view.dart';
import '../views/summary_view.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeView(),
  '/history': (context) => const ShipmentHistoryView(),
  '/calculate': (context) => CalculateOrderView(),
  '/summary': (context) => const SummaryView(),
  '/search': (context) => const SearchView(),
};