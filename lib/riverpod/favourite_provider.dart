import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/favourite_item_model.dart';
import 'favourite_state.dart';

final favouriteProvider = StateNotifierProvider<FavouriteStateNotifier, FavouriteState>((ref) {
  return FavouriteStateNotifier();
});

class FavouriteStateNotifier extends StateNotifier<FavouriteState> {
  FavouriteStateNotifier() : super(FavouriteState(allItems: [], favouriteItems: [], search: ''));

  void addFavouriteItem() {
    final items = [
      FavouriteItemModel(id: '1', name: 'Macbook', isFavourite: false),
      FavouriteItemModel(id: '2', name: 'Iphone', isFavourite: false),
      FavouriteItemModel(id: '3', name: 'Galaxy S24 Ultra', isFavourite: true),
      FavouriteItemModel(id: '4', name: 'Asus TUF', isFavourite: true),
      FavouriteItemModel(id: '5', name: 'HP Victus', isFavourite: false),
      FavouriteItemModel(id: '6', name: 'Mac Mini M4', isFavourite: true),
    ];

    state = state.copyWith(
      allItems: items.toList(),
      favouriteItems: items.toList(),
    );
  }

  void toggleFavourite(String id) {
    final items = state.allItems.map((item) {
      if (item.id == id) {
        return item.copyWith(isFavourite: !item.isFavourite);
      }
      return item;
    }).toList();
    state = state.copyWith(
      allItems: items,
      favouriteItems: _favouriteList(items, 'All'),
    );
  }

  void filterList(String search) {
    state = state.copyWith(
      favouriteItems: _filterList(state.allItems, search)
    );
  }

  List<FavouriteItemModel> _filterList(List<FavouriteItemModel> items, String search) {
    if (search.isEmpty) return items;
    final filteredList = items.where((item) => item.name.toLowerCase().contains(search.toLowerCase())).toList();
    return filteredList;
  }

  void favouriteList(String option) {
    state = state.copyWith(
        favouriteItems: _favouriteList(state.allItems, option)
    );
  }

  List<FavouriteItemModel> _favouriteList(List<FavouriteItemModel> items, String option) {
    if (option == 'All') return items;
    final favouriteList = items.where((item) => item.isFavourite == true).toList();
    return favouriteList;
  }
}