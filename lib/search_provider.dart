import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = StateNotifierProvider<SearchProvider, SearchState>((ref) {
  return SearchProvider();
});

class SearchProvider extends StateNotifier<SearchState> {
  SearchProvider() : super(SearchState(query: ''));

  void setSearch(String query) {
    state = state.copyWith(query: query);
  }
}

class SearchState{
  final String query;
  SearchState({required this.query});

  SearchState copyWith({String? query}){
    return SearchState(query: query ?? this.query);
  }
}