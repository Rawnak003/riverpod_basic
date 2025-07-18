import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderProvider = StateProvider<AppState>((ref) {
  return AppState(sliderValue: 0.5, showSliderValue: true);
});

class AppState {
  final double sliderValue;
  final bool showSliderValue;

  AppState({
    required this.sliderValue,
    required this.showSliderValue,
  });

  AppState copyWith({double? sliderValue, bool? showSliderValue,}) {
    return AppState(
      sliderValue: sliderValue ?? this.sliderValue,
      showSliderValue: showSliderValue ?? this.showSliderValue,
    );
  }
}