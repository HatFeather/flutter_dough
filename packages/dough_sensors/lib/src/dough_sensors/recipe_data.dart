import 'package:dough/dough.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'gyro_recipe.dart';

/// Settings which will be applied to the [Dough] widget at runtime.
@immutable
class DoughSensorsRecipeData extends Equatable {
  /// Creates a raw recipe, all values must be specified.
  const DoughSensorsRecipeData({
    this.gyroRecipe = const GyroDoughRecipeData(),
  });

  /// Creates the fallback recipe.
  factory DoughSensorsRecipeData.fallback() => const DoughSensorsRecipeData();

  /// Default settings applied to [DraggableDough] widgets.
  final GyroDoughRecipeData gyroRecipe;

  /// Copies the current recipe with some new values.
  DoughSensorsRecipeData copyWith({
    GyroDoughRecipeData? gyroRecipe,
  }) {
    return DoughSensorsRecipeData(
      gyroRecipe: gyroRecipe ?? this.gyroRecipe,
    );
  }

  @override
  List<Object> get props => [
        gyroRecipe,
      ];
}
