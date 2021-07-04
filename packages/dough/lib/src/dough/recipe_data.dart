import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'dough.dart';
import 'dough_controller.dart';
import 'draggable.dart';
import 'draggable_recipe.dart';

/// Settings which will be applied to the [Dough] widget at runtime.
@immutable
class DoughRecipeData extends Equatable {
  /// Creates a raw recipe, all values must be specified.
  const DoughRecipeData({
    this.viscosity = 7000,
    this.adhesion = 12,
    this.expansion = 1,
    this.usePerspectiveWarp = false,
    this.perspectiveWarpDepth = 0.015,
    this.entryDuration = const Duration(milliseconds: 20),
    this.entryCurve = Curves.easeInOut,
    this.exitDuration = const Duration(milliseconds: 500),
    this.exitCurve = Curves.elasticIn,
    this.draggableRecipe = const DraggableDoughRecipeData(),
  });

  /// How 'thick' a [Dough] widget is. Higher values make for harder/less
  /// elastic [Dough]. A typical value would be something like 7000. Lower
  /// values like 100 will result in unexpected behaviors.
  final double viscosity;

  /// How sticky a [Dough] widget is. Higher values result in [Dough] that
  /// doesn't move around a lot when its dragged. Lower values result in
  /// really "slippery" [Dough]. A typical value would be something like 12.
  final double adhesion;

  /// The factor by which a [Dough] widget expands when activated.
  final double expansion;

  /// Whether perspective warping should be used. When enabled, [Dough] widgets
  /// will perform a 3D rotation slightly towards [DoughController.delta]. This
  /// will give the illusion that the dough has mass and make it feel more
  /// jiggly.
  final bool usePerspectiveWarp;

  /// The depth of the perspective warp. A typical value would be something
  /// like 0.015.
  final double perspectiveWarpDepth;

  /// How long a [Dough] widget takes to transition into a squished state.
  final Duration entryDuration;

  /// The curve by which a [Dough] widget enters a squished state.
  final Curve entryCurve;

  /// How long a [Dough] widget takes to transition out of a squished state.
  final Duration exitDuration;

  /// The curve by which a [Dough] widget exits a squished state.
  final Curve exitCurve;

  /// Default settings applied to [DraggableDough] widgets.
  final DraggableDoughRecipeData draggableRecipe;

  /// Copies the current recipe with some new values.
  DoughRecipeData copyWith({
    double? viscosity,
    double? adhesion,
    double? expansion,
    bool? usePerspectiveWarp,
    double? perspectiveWarpDepth,
    Duration? entryDuration,
    Curve? entryCurve,
    Duration? exitDuration,
    Curve? exitCurve,
    DraggableDoughRecipeData? draggableRecipe,
  }) {
    return DoughRecipeData(
      viscosity: viscosity ?? this.viscosity,
      adhesion: adhesion ?? this.adhesion,
      expansion: expansion ?? this.expansion,
      usePerspectiveWarp: usePerspectiveWarp ?? this.usePerspectiveWarp,
      perspectiveWarpDepth: perspectiveWarpDepth ?? this.perspectiveWarpDepth,
      entryDuration: entryDuration ?? this.entryDuration,
      entryCurve: entryCurve ?? this.entryCurve,
      exitDuration: exitDuration ?? this.exitDuration,
      exitCurve: exitCurve ?? this.exitCurve,
      draggableRecipe: draggableRecipe ?? this.draggableRecipe,
    );
  }

  @override
  List<Object> get props => [
        viscosity,
        adhesion,
        expansion,
        usePerspectiveWarp,
        perspectiveWarpDepth,
        entryDuration,
        entryCurve,
        exitDuration,
        exitCurve,
        draggableRecipe,
      ];
}
