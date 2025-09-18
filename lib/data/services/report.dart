import 'package:qahwaa_project/data/models/order.dart';

abstract class Report {
  Map<String, int> popularDrink();
  int totalOrder();
  String topDrink();
}

class ReportGenerator implements Report {
  final List<Order> _orders;

  ReportGenerator(this._orders);
  @override
  Map<String, int> popularDrink() {
    final Map<String, int> counts = {};
    for (var order in _orders.where((e) => e.isDone)) {
      counts.update(
        order.drink.drinkName,
        (value) => value + 1,
        ifAbsent: () => 1,
      );
    }
    return counts;
  }

  @override
  int totalOrder() {
    return _orders.where((e) => e.isDone).length;
  }

  @override
  String topDrink() {
    final drinks = popularDrink();
    if (drinks.isEmpty) return "No drinks yet";

    final sorted =
        drinks.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    return sorted.first.key;
  }
}
