import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes/app/router/router.gr.dart';
import 'package:notes/presentation/common/btn/custom_button.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: CustomButton(
          label: 'Go to Note',
          onPressed: () => context.router.push(const NoteRoute()),
        ),
      ),
    );
  }
}