import 'package:flutter/material.dart';
import 'package:qahwaa_project/data/services/order_manager.dart';
import 'package:qahwaa_project/data/services/report.dart';

class ReportView extends StatelessWidget {
  final OrderManager orderManager;

  const ReportView({super.key, required this.orderManager});

  @override
  Widget build(BuildContext context) {
    final report = ReportGenerator(orderManager.allOrders);

    return Scaffold(
      appBar: AppBar(title: const Text("Report")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.done_all, color: Colors.green),
                title: const Text("Total Orders Done"),
                trailing: Text("${report.totalOrder()}"),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: const Icon(Icons.local_cafe, color: Colors.brown),
                title: const Text("Most Popular Drink"),
                trailing: Text(
                  report.topDrink().toString()
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
