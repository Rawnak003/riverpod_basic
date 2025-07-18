import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basic/slider_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final sliderValue = ref.watch(sliderProvider);
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent.withOpacity(sliderValue),
                  ),
                );
              }
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Consumer(
                builder: (context, ref, child) {
                  final sliderValue = ref.watch(sliderProvider);
                  return Slider(
                    value: sliderValue,
                    onChanged: (value) {
                      ref.read(sliderProvider.notifier).state = value;
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}


