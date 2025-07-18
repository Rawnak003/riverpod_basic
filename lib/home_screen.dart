import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basic/search_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  ref.read(searchProvider.notifier).setSearch(value);
                },
              ),
              SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) {
                  final searchText = ref.watch(searchProvider);
                  return Text(searchText.query);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
