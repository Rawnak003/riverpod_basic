import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'item_model.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<ItemModel>>(
  (ref) => ItemNotifier(),
);

class ItemNotifier extends StateNotifier<List<ItemModel>> {
  ItemNotifier() : super([]);

  void addItem(String name) {
    final item = ItemModel(id: DateTime.now().toString(), title: name);
    state.add(item);
    state = state.toList();
  }

  void deleteItem(String id) {
    state.removeWhere((item) => item.id == id);
    state = state.toList();
  }

  void updateItem(String id, String name) {
    final item = state.firstWhere((item) => item.id == id);
    item.title = name;
    state = state.toList();
  }
}