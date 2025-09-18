

import 'package:qahwaa_project/data/models/order.dart';
import 'package:qahwaa_project/data/repo/order_repo.dart';

class InMemoryOrderRepo implements OrderRepo {
  final List<Order> _orders = [];
  @override
  void addOrder(Order order) {
    _orders.add(order);
  }

  @override
  List<Order> getAllOrders() {
  return  List.unmodifiable(_orders);
  }
}
