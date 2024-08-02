import 'package:dio_explained/src/configs/route_handler.dart';
import 'package:dio_explained/src/configs/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio Explained',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: AppRouteHandler.onGenerateRoute,
    );
  }
}
