import 'package:dough/dough.dart';
import 'package:equatable/equatable.dart';

import 'gyro.dart';

/// Preferences applied to [GyroDough] widgets.
/// 
/// Please note that this widget will be moved over to a separate package
/// to remove a platform depedency.
class GyroDoughRecipeData extends Equatable {
  /// Creates raw [GyroDough] preferences, all values must be specified.
  const GyroDoughRecipeData({
    this.sampleCount = 10,
    this.gyroMultiplier = 100,
  });

  /// The number of samples to use in the final gyro output. In technical
  /// terms, this value controls the intensity of 'low-pass filter' applied
  /// to a device's accelerometer.
  ///
  /// Higher values result in smoother gyro effects (slow-ish [Dough]), while
  /// lower values result in quick (and possibly more jagged) [Dough] effects.
  ///
  /// A typical value would be something like `10`. The minimum accepted
  /// sample count is `1`.
  final int sampleCount;

  /// The value by which accelerometer values are multiplied. Higher
  /// [gyroMultiplier] values will result in [Dough] that is more sensitive to
  /// motion.
  ///
  /// A typical value would be something like `100`.
  final double gyroMultiplier;

  /// Copies these preferences with some new values.
  GyroDoughRecipeData copyWith({
    int? sampleCount,
    double? gyroMultiplier,
  }) {
    return GyroDoughRecipeData(
      sampleCount: sampleCount ?? this.sampleCount,
      gyroMultiplier: gyroMultiplier ?? this.gyroMultiplier,
    );
  }

  @override
  List<Object> get props => [
        sampleCount,
        gyroMultiplier,
      ];
}
