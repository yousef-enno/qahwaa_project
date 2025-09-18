import 'package:qahwaa_project/data/models/drink_model.dart';

class Order {
  final String _customerName;
  final DrinkModel _drink;
  final String _note;
  bool _isDone = false;

  Order({
    required String customerName,
    required DrinkModel drink,
    required String note,
  }) : _customerName = customerName,
       _drink = drink,
       _note = note;

  String get customerName => _customerName;
  DrinkModel get drink => _drink;
  String get note => _note;
  bool get isDone => _isDone;

  void markDone() => _isDone = true;
}
