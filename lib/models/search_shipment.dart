class SearchShipment {
  final String title;
  final String id;
  final String route;

  SearchShipment({
    required this.title,
    required this.id,
    required this.route,
  });

  bool matches(String query) {
    final lower = query.toLowerCase();
    return title.toLowerCase().contains(lower) ||
        id.toLowerCase().contains(lower) ||
        route.toLowerCase().contains(lower);
  }
}
