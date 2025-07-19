import 'package:riverpod_basic/model/favourite_item_model.dart';

class FavouriteState {
  final List<FavouriteItemModel> allItems;
  final List<FavouriteItemModel> favouriteItems;
  final String search;

  FavouriteState({
    required this.allItems,
    required this.favouriteItems,
    required this.search,
  });

  FavouriteState copyWith({
    List<FavouriteItemModel>? allItems,
    List<FavouriteItemModel>? favouriteItems,
    String? search,
  }) {
    return FavouriteState(
      allItems: allItems ?? this.allItems,
      favouriteItems: favouriteItems ?? this.favouriteItems,
      search: search ?? this.search,
    );
  }
}