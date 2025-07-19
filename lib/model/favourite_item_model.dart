class FavouriteItemModel {
  final String id;
  final String name;
  final bool isFavourite;

  FavouriteItemModel({
    required this.id,
    required this.name,
    required this.isFavourite,
  });

  FavouriteItemModel copyWith({
    String? id,
    String? name,
    bool? isFavourite,
  }) {
    return FavouriteItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}