import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() {
  runApp(const MoveMateApp());
}

class MoveMateApp extends StatelessWidget {
  const MoveMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MoveMate',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: 'SFProDisplay',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: appRoutes,
        navigatorObservers: [routeObserver]);
  }
}
