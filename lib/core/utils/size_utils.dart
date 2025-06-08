import 'package:flutter/material.dart';

const double FIGMA_DESIGN_WIDTH = 393.0;
const double FIGMA_DESIGN_HEIGHT = 852.0;
const double FIGMA_DESIGN_STATUS_BAR = 0.0;

extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;

  double get h => ((toDouble() * _width) / FIGMA_DESIGN_WIDTH);

  double get fSize => ((toDouble() * _width) / FIGMA_DESIGN_WIDTH);
}

extension FormatExtension on num {
  double toDoubleValue([int fractionDigits = 2]) {
    return double.parse(toStringAsFixed(fractionDigits));
  }

  double isNonZero([double defaultValue = 0.0]) {
    return this > 0 ? toDouble() : defaultValue;
  }
}

enum DeviceType { mobile, tablet, desktop }

typedef ResponsiveBuild =
    Widget Function(
      BuildContext context,
      Orientation orientation,
      DeviceType deviceType,
    );

class Sizer extends StatelessWidget {
  const Sizer({super.key, required this.builder});
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeUtils.setScreenSize(constraints, orientation);
            return builder(context, orientation, SizeUtils.deviceType);
          },
        );
      },
    );
  }
}

class SizeUtils {
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static late double height;
  static late double width;

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      width = _getValidSize(boxConstraints.maxWidth, FIGMA_DESIGN_WIDTH);
      height = _getValidSize(boxConstraints.maxHeight);
    } else {
      width = _getValidSize(boxConstraints.maxHeight, FIGMA_DESIGN_WIDTH);
      height = _getValidSize(boxConstraints.maxWidth);
    }

    deviceType = _determineDeviceType(width);
  }

  static double _getValidSize(double size, [double defaultValue = 0.0]) {
    return size > 0 ? size : defaultValue;
  }

  static DeviceType _determineDeviceType(double width) {
    if (width > 900) return DeviceType.desktop;
    if (width > 600) return DeviceType.tablet;
    return DeviceType.mobile;
  }
}
