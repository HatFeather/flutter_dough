import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'recipe_data.dart';

/// Inherited settings for [Dough] widgets that use sensors. Use
/// this to override the default settings for [Dough] widgets
/// that use sensors.
@immutable
class DoughSensorsRecipe extends StatelessWidget {
  /// Creates a [DoughSensorsRecipe] widget.
  const DoughSensorsRecipe({
    Key? key,
    required this.child,
    this.data = const DoughSensorsRecipeData(),
  }) : super(key: key);

  /// This widget's child. Any [Dough] widget below this widget will inherit
  /// the [data] provided in this recipe.
  final Widget child;

  /// The settings to be applied to all [Dough] widgets below this widget.
  final DoughSensorsRecipeData data;

  /// Gets the inherited [DoughRecipeData]. If no recipe is found,
  /// a default one will be returned instead.
  static DoughSensorsRecipeData of(
    BuildContext context, [
    bool listen = true,
  ]) {
    try {
      return Provider.of<DoughSensorsRecipeData>(context, listen: listen);
    } on ProviderNotFoundException catch (_) {
      return const DoughSensorsRecipeData();
    }
  }

  /// Gets the inherited [DoughRecipeData] without listening to it. If no
  /// recipe is found, a default one will be returned instead.
  static DoughSensorsRecipeData read(BuildContext context) {
    return of(context, false);
  }

  /// Gets the inherited [DoughRecipeData] and listens to it. If no recipe
  /// is found, a default one will be returned instead.
  static DoughSensorsRecipeData watch(BuildContext context) {
    return of(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: data,
      child: child,
    );
  }
}
