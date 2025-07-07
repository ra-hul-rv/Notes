import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes/presentation/common/btn/custom_button.dart';

@RoutePage()
class NotePage extends StatelessWidget {
  const NotePage({super.key});

  static const String path = '/note';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note')),
      body: Center(
        child: CustomButton(
          label: 'Back to Home',
          onPressed: () => context.router.maybePop(),
        ),
      ),
    );
  }
}