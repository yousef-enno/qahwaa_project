

import 'package:qahwaa_project/data/models/order.dart';

abstract class OrderRepo {
  void addOrder(Order order);
  List<Order> getAllOrders();
}
