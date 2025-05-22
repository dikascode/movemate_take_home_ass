class OrderController {
  List<String> getCategories() {
    return ['Documents', 'Glass', 'Liquid', 'Food', 'Electronic', 'Product', 'Others'];
  }

  List<String> getPackagingTypes() {
    return ['Box', 'Envelope', 'Pallet'];
  }
}
