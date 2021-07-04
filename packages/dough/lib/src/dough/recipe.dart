import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dough.dart';
import 'recipe_data.dart';

/// Inherited settings for [Dough] widgets. Use this to override
/// the default [Dough] settings.
@immutable
class DoughRecipe extends StatelessWidget {
  /// Creates a [DoughRecipe] widget.
  const DoughRecipe({
    Key? key,
    required this.child,
    this.data,
  }) : super(key: key);

  /// The fallback recipe.
  static final DoughRecipeData _kFallbackRecipe = DoughRecipeData.fallback();

  /// This widget's child. Any [Dough] widget below this widget will inherit
  /// the [data] provided in this recipe.
  final Widget child;

  /// The settings to be applied to all [Dough] widgets below this widget.
  final DoughRecipeData? data;

  /// Gets the inherited [DoughRecipeData]. If no recipe is found,
  /// a default one will be returned instead.
  static DoughRecipeData of(
    BuildContext context, [
    bool listen = true,
  ]) {
    try {
      return Provider.of<DoughRecipeData>(context, listen: listen);
    } on ProviderNotFoundException catch (_) {
      return _kFallbackRecipe;
    }
  }

  /// Gets the inherited [DoughRecipeData] without listening to it. If no
  /// recipe is found, a default one will be returned instead.
  static DoughRecipeData read(BuildContext context) {
    return of(context, false);
  }

  /// Gets the inherited [DoughRecipeData] and listens to it. If no recipe
  /// is found, a default one will be returned instead.
  static DoughRecipeData watch(BuildContext context) {
    return of(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: data ?? _kFallbackRecipe,
      child: child,
    );
  }
}
