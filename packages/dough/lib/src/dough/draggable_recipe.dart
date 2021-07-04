import 'package:equatable/equatable.dart';

import 'draggable.dart';

/// Preferences applied to [DraggableDough] widgets.
class DraggableDoughRecipeData with EquatableMixin {
  /// Creates raw [DraggableDough] preferences, all values must be specified.
  const DraggableDoughRecipeData({
    this.breakDistance = 80,
    this.useHapticsOnBreak = true,
  });

  /// The logical pixel distance at which the [DraggableDough] should
  /// elastically break its hold on the origin and enter a freely movable
  /// state.
  final double breakDistance;

  /// Whether [DraggableDough] widgets should trigger haptic feedback when
  /// the dough breaks its hold on the origin.
  final bool useHapticsOnBreak;

  /// Copies these preferences with some new values.
  DraggableDoughRecipeData copyWith({
    double? breakDistance,
    bool? useHapticsOnBreak,
  }) {
    return DraggableDoughRecipeData(
      breakDistance: breakDistance ?? this.breakDistance,
      useHapticsOnBreak: useHapticsOnBreak ?? this.useHapticsOnBreak,
    );
  }

  @override
  List<Object> get props => [
        breakDistance,
        useHapticsOnBreak,
      ];
}

/// Preferences applied to [DraggableDough] widgets.
@Deprecated('Use DraggableDoughRecipeData instead')
class DraggableDoughPrefs extends Equatable
    implements DraggableDoughRecipeData {
  /// Creates raw [DraggableDough] preferences, all values must be specified.
  const DraggableDoughPrefs.raw({
    required this.breakDistance,
    required this.useHapticsOnBreak,
  });

  /// Creates [DraggableDough] preferences.
  factory DraggableDoughPrefs({
    double? breakDistance,
    bool? useHapticsOnBreak,
  }) {
    return DraggableDoughPrefs.raw(
      breakDistance: breakDistance ?? 80,
      useHapticsOnBreak: useHapticsOnBreak ?? true,
    );
  }

  /// Creates fallback [DraggableDough] preferences.
  factory DraggableDoughPrefs.fallback() => DraggableDoughPrefs();

  /// The logical pixel distance at which the [DraggableDough] should
  /// elastically break its hold on the origin and enter a freely movable
  /// state.
  @override
  final double breakDistance;

  /// Whether [DraggableDough] widgets should trigger haptic feedback when
  /// the dough breaks its hold on the origin.
  @override
  final bool useHapticsOnBreak;

  /// Copies these preferences with some new values.
  @override
  DraggableDoughPrefs copyWith({
    double? breakDistance,
    bool? useHapticsOnBreak,
  }) {
    return DraggableDoughPrefs.raw(
      breakDistance: breakDistance ?? this.breakDistance,
      useHapticsOnBreak: useHapticsOnBreak ?? this.useHapticsOnBreak,
    );
  }

  @override
  List<Object> get props => [
        breakDistance,
        useHapticsOnBreak,
      ];

  @override
  bool get stringify => true;
}
