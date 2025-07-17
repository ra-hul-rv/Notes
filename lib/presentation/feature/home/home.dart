import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes/presentation/feature/home/widgets/single_note_box.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String path = '/';
  @override
  Widget build(BuildContext context) {
    void onPressedEvent() {
      print('Floating Button Pressed');
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Column(children: [SingleNoteBox()]),
        floatingActionButton: FloatingActionButton(
          onPressed: onPressedEvent,
          tooltip: 'Add Item',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
