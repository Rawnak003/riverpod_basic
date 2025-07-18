import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref) { /// To manage small state changes StateProvider is used
  return 0;
});
final switchProvider = StateProvider<bool>((ref) {
  return false;
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer( /// To define which widget should be change when the state changes
              builder: (context, ref, child) {
                final age = ref.watch(counter);
                return Text(age.toString(), style: const TextStyle(fontSize: 24)); /// Here only the text will change and rebuild
              }
            ),
            SizedBox(height: 32),
            Consumer(
              builder: (context, ref, child) {
                final switchValue = ref.watch(switchProvider);
                return Switch(
                  value: switchValue,
                  onChanged: (value) {
                    ref.read(switchProvider.notifier).state = value;
                  },
                );
              },
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state--; /// state will be changed and value of the provider will be decreased
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state++; /// state will be changed and value of the provider will be increased
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


