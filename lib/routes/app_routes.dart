import 'package:flutter/material.dart';
import '../views/home_view.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeView(),
};