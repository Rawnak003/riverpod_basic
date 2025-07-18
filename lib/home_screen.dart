import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basic/slider_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Rebuilding Build');
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(sliderProvider);
                print("Container Rebuild");
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent.withOpacity(state.sliderValue),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.showSliderValue ? state.sliderValue.toStringAsFixed(2) : '',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            final notifier = ref.read(sliderProvider.notifier);
                            notifier.state = notifier.state.copyWith(
                              showSliderValue: !state.showSliderValue,
                            );
                          },
                          child: Icon(
                            state.showSliderValue ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Consumer(
                builder: (context, ref, child) {
                  print("Slider Rebuild");
                  final state = ref.watch(sliderProvider.select((state) => state.sliderValue));
                  return Slider(
                    value: state,
                    onChanged: (value) {
                      final notifier = ref.read(sliderProvider.notifier);
                      notifier.state = notifier.state.copyWith(
                        sliderValue: value,
                      );
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
