import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(itemProvider.notifier).addItem('New Item');
        },
        child: Icon(Icons.add),
      ),
      body: item.isEmpty ? Center(child: Text('No Items'),) : ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          final itemDetails = item[index];
          return ListTile(
            title: Text(itemDetails.title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: (){
                  ref.read(itemProvider.notifier).updateItem(itemDetails.id, 'new');
                }, icon: Icon(Icons.edit)),
                IconButton(onPressed: (){
                  ref.read(itemProvider.notifier).deleteItem(itemDetails.id);
                }, icon: Icon(Icons.delete)),
              ],
            ),
          );
        },
      ),
    );
  }
}
