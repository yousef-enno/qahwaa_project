import 'package:flutter/material.dart';
import 'package:qahwaa_project/data/models/drink_model.dart';
import 'package:qahwaa_project/data/repo/in_memory_order_repo.dart';
import 'package:qahwaa_project/data/services/order_manager.dart';

import 'package:qahwaa_project/views/report_view.dart';

class QahwaaDashboard extends StatefulWidget {
  const QahwaaDashboard({super.key});

  @override
  State<QahwaaDashboard> createState() => _QahwaaDashboardState();
}

class _QahwaaDashboardState extends State<QahwaaDashboard> {
  late OrderManager orderManager;
  final TextEditingController customerController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  String selectedDrink = "Shai";
  final List<String> drinks = ['Shai', 'Turkish Coffee', 'Hibiscus'];

  @override
  void initState() {
    orderManager = OrderManager(InMemoryOrderRepo());
    super.initState();
  }

  DrinkModel _mapDrink(String drinkName) {
    switch (drinkName) {
      case 'Shai':
        return Shai();
      case 'Turkish Coffee':
        return TurkishCoffee();
      case 'Hibiscus':
        return Hibiscus();
      default:
        return Shai();
    }
  }

  @override
  Widget build(BuildContext context) {
    final pendingOrders = orderManager.getPendingOrder();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Center(
            child: Text(
              'Welcome to Our Qahwaa',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReportView(orderManager: orderManager),
                ),
              );
            },
            child: Container(
              height: 66,
              width: double.infinity,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Report',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),

          Expanded(
            child:
                pendingOrders.isEmpty
                    ? const Center(
                      child: Text(
                        "No Orders Yet",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                    : ListView.builder(
                      itemCount: pendingOrders.length,
                      itemBuilder: (context, index) {
                        final order = pendingOrders[index];
                        return Card(
                          margin: const EdgeInsets.all(8),
                          child: ListTile(
                            leading: const Icon(
                              Icons.local_cafe,
                              color: Colors.brown,
                            ),
                            title: Text(
                              "${order.customerName} - ${order.drink.drinkName}",
                            ),
                            subtitle: Text(
                              order.note.isEmpty
                                  ? "No special notes"
                                  : order.note,
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  orderManager.doneOrder(order);
                                });
                              },
                              icon: Icon(Icons.check_box_outline_blank_rounded),
                            ),
                          ),
                        );
                      },
                    ),
          ),
          SizedBox(height: 20),

          GestureDetector(
            onTap: () {
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: customerController,
                            decoration: InputDecoration(
                              labelText: 'Customer Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 12),
                          DropdownButtonFormField<String>(
                            value: selectedDrink,
                            decoration: const InputDecoration(
                              labelText: "Drink Type",
                              border: OutlineInputBorder(),
                            ),
                            items:
                                drinks.map((drink) {
                                  return DropdownMenuItem(
                                    value: drink,
                                    child: Text(drink),
                                  );
                                }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedDrink = value!;
                              });
                            },
                          ),
                          SizedBox(height: 12),
                          TextField(
                            controller: notesController,
                            decoration: const InputDecoration(
                              labelText: "Notes",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              if (customerController.text.trim().isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Customer name cannot be empty",
                                    ),
                                  ),
                                );
                                return;
                              }

                              setState(() {
                                orderManager.addOrder(
                                  customerController.text.trim(),
                                  _mapDrink(selectedDrink),
                                  notesController.text.trim(),
                                );
                              });
                              Navigator.pop(context);
                              customerController.clear();
                              notesController.clear();
                            },
                            child: const Text("Save"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              color: Colors.red,
              height: 44,
              width: double.infinity,
              child: Center(
                child: Text(
                  ' + Add New Order ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
