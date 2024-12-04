import 'package:flutter/material.dart';

/// Spacing constants for consistent padding and margins
abstract class Spacing {
  /// 4.0
  static const xxxs = 4.0;

  /// 8.0
  static const xxs = 8.0;

  /// 12.0
  static const xs = 12.0;

  /// 16.0
  static const sm = 16.0;

  /// 24.0
  static const md = 24.0;

  /// 32.0
  static const lg = 32.0;

  /// 40.0
  static const xl = 40.0;

  /// 48.0
  static const xxl = 48.0;

  /// 56.0
  static const xxxl = 56.0;
}

/// Icon size constants
abstract class IconSizes {
  /// 16.0 - Sehr kleine Icons
  static const xs = 16.0;

  /// 20.0 - Kleine Icons (z.B. für ListTiles)
  static const sm = 20.0;

  /// 24.0 - Standard Material Icons
  static const md = 24.0;

  /// 32.0 - Größere Icons
  static const lg = 32.0;

  /// 48.0 - Große Icons (z.B. für Placeholder)
  static const xl = 48.0;

  /// 64.0 - Sehr große Icons (z.B. für Empty States)
  static const xxl = 64.0;
}

/// Reusable gaps for vertical spacing
abstract class VGap {
  /// 4.0 height
  static const xxxs = SizedBox(height: Spacing.xxxs);

  /// 8.0 height
  static const xxs = SizedBox(height: Spacing.xxs);

  /// 12.0 height
  static const xs = SizedBox(height: Spacing.xs);

  /// 16.0 height
  static const sm = SizedBox(height: Spacing.sm);

  /// 24.0 height
  static const md = SizedBox(height: Spacing.md);

  /// 32.0 height
  static const lg = SizedBox(height: Spacing.lg);

  /// 40.0 height
  static const xl = SizedBox(height: Spacing.xl);

  /// 48.0 height
  static const xxl = SizedBox(height: Spacing.xxl);

  /// 56.0 height
  static const xxxl = SizedBox(height: Spacing.xxxl);
}

/// Reusable gaps for horizontal spacing
abstract class HGap {
  /// 4.0 width
  static const xxxs = SizedBox(width: Spacing.xxxs);

  /// 8.0 width
  static const xxs = SizedBox(width: Spacing.xxs);

  /// 12.0 width
  static const xs = SizedBox(width: Spacing.xs);

  /// 16.0 width
  static const sm = SizedBox(width: Spacing.sm);

  /// 24.0 width
  static const md = SizedBox(width: Spacing.md);

  /// 32.0 width
  static const lg = SizedBox(width: Spacing.lg);

  /// 40.0 width
  static const xl = SizedBox(width: Spacing.xl);

  /// 48.0 width
  static const xxl = SizedBox(width: Spacing.xxl);

  /// 56.0 width
  static const xxxl = SizedBox(width: Spacing.xxxl);
}
