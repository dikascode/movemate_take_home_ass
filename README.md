# MoveMate

A clean, animated Flutter logistics app — built with attention to structure, state management, and pixel-level UI polish.

## Features

- Smooth entrance animations across all screens using `flutter_animate`
- Shipment estimation with category chips, weight, and packaging type
- Animated summary view with count-up effect for estimated cost
- Search view with live filtering and animated result list
- Reusable widgets and consistent design system using `Inter` font
- MVC-aligned folder structure for maintainability

## Project Structure

```
lib/
├── controllers/         # Business logic (Order, Shipment, etc.)
├── models/              # Data classes like Shipment
├── views/               # Screens: Home, Search, Calculate, Summary, etc.
├── widgets/             # Reusable UI components (e.g., ShipmentCard)
└── main.dart            # App entry point
```

## Animations

Used [`flutter_animate`](https://pub.dev/packages/flutter_animate) for subtle and expressive UI transitions:

- Search results slide + fade
- Button bounce/fade on calculate
- Shipment cards animate per index
- Count-up effect in summary view (`animated_digit`)

All animations are optimized to replay when returning to a screen.

## Notes

- The project assumes no backend/API for now — mock data is handled locally in `controllers`.
- You can navigate between views using named routes (`/calculate`, `/search`, etc.).
- Search input auto-focuses and navigates instantly from Home → Search screen.

## Setup

```bash
git clone https://github.com/your-username/movemate_take_home_ass.git
cd movemate
flutter pub get
flutter run
```