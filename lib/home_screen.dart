import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// provider
final helloProvider = Provider<String>((ref) {
  return 'Hello';
});

class HomeScreen extends ConsumerWidget { // ConsumerWidget is a widget that can access providers and rebuilds when the provider changes
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { // WidgetRef is a reference to the widget. For this we don't need to use context
    final hello = ref.watch(helloProvider); // watch is a function that returns the value of the provider and updates the widget when the value changes
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text(hello, style: const TextStyle(fontSize: 24)), // The value of the provider is passed to the Text widget
      ),
    );
  }
}

