import 'package:qahwaa_project/data/models/drink_model.dart';
import 'package:qahwaa_project/data/models/order.dart';
import 'package:qahwaa_project/data/repo/order_repo.dart';

class OrderManager {
  final OrderRepo _orderRepo;

  OrderManager(this._orderRepo);
  void addOrder(String name, DrinkModel drink, String note) {
    if (name.isEmpty) throw ArgumentError('add name');
    _orderRepo.addOrder(Order(customerName: name, drink: drink, note: note));
  }

  List<Order> getPendingOrder() =>
      _orderRepo.getAllOrders().where((e) => !e.isDone).toList();
  void doneOrder(Order order) => order.markDone();

  List<Order> get allOrders => List.unmodifiable(_orderRepo.getAllOrders());
}
