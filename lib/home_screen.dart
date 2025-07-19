import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basic/riverpod/favourite_provider.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              ref.read(favouriteProvider.notifier).favouriteList(value);
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'All',
                  child: Text('All'),
                ),
                const PopupMenuItem(
                  value: 'Favourite',
                  child: Text('Favourite'),
                ),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(favouriteProvider.notifier).addFavouriteItem();
      }, child: const Icon(Icons.add),),
      body: Consumer(
        builder: (context, ref, child) {
          final items = ref.watch(favouriteProvider);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  onChanged: (value) {
                    ref.read(favouriteProvider.notifier).filterList(value);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.favouriteItems.length,
                    itemBuilder: (context, index) {
                      final favouriteItem = items.favouriteItems[index];
                      return ListTile(
                        title: Text(favouriteItem.name),
                        trailing: IconButton(
                          icon: Icon(favouriteItem.isFavourite ? Icons.favorite : Icons.favorite_border),
                          onPressed: () {
                            ref.read(favouriteProvider.notifier).toggleFavourite(favouriteItem.id);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
