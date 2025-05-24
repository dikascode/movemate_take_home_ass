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
            primarySwatch: Colors.deepPurple,
            fontFamily: 'Inter',
            textTheme: const TextTheme(
              headlineLarge: TextStyle(fontSize: 22),
              titleLarge: TextStyle(fontSize: 18),
              titleMedium: TextStyle(
                fontSize: 16,
              ),
              bodyMedium: TextStyle(fontSize: 14),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.deepPurple,
              titleTextStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white),
              iconTheme: IconThemeData(color: Colors.white),
            )),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: appRoutes,
        navigatorObservers: [routeObserver]);
  }
}
