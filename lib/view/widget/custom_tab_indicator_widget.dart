import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  final double height;
  final Color color;
  final double indicatorWidth;
  final double horizontalRadius;

  CustomTabIndicator({
    required this.height,
    required this.color,
    required this.indicatorWidth,
    required this.horizontalRadius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MyTabIndicatorPainter(this, onChanged);
  }
}

class _MyTabIndicatorPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _MyTabIndicatorPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint();
    paint.color = decoration.color;
    paint.style = PaintingStyle.fill;

    final double indicatorHeight = decoration.height;
    final double yOffset = rect.bottom - indicatorHeight;

    final double indicatorWidth = decoration.indicatorWidth;
    final double horizontalRadius = decoration.horizontalRadius;
    final double xOffset = rect.left + (rect.width - indicatorWidth) / 2;

    final Rect indicatorRect =
        Rect.fromLTWH(xOffset, yOffset, indicatorWidth, indicatorHeight);

    final RRect indicatorRRect = RRect.fromRectAndCorners(
      indicatorRect,
      topLeft: Radius.circular(horizontalRadius),
      topRight: Radius.circular(horizontalRadius),
      bottomLeft: Radius.circular(horizontalRadius),
      bottomRight: Radius.circular(horizontalRadius),
    );

    canvas.drawRRect(indicatorRRect, paint);
  }
}
