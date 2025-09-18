import 'package:flutter/material.dart';
import 'package:qahwaa_project/views/qahwaa_dashboard.dart';

void main() {
  runApp(QahwaaApp());
}

class QahwaaApp extends StatelessWidget {
  const QahwaaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QahwaaDashboard(),
    );
  }
}
