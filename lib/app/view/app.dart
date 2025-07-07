
import 'package:flutter/material.dart';
import 'package:notes/app/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'Auto Route Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}