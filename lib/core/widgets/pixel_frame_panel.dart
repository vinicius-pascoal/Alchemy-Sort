import 'package:flutter/material.dart';

class PixelFramePanel extends StatelessWidget {
  const PixelFramePanel({
    super.key,
    required this.child,
    this.frame = PixelFrame.dark,
    this.padding = const EdgeInsets.all(20),
    this.backgroundColor = const Color(0xAA0F0A1A),
    this.margin,
    this.constraints,
  });

  final Widget child;
  final PixelFrame frame;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      constraints: constraints,
      decoration: BoxDecoration(color: backgroundColor),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              frame.assetPath,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.none,
            ),
          ),
          Center(
            child: Padding(padding: padding, child: child),
          ),
        ],
      ),
    );
  }
}

enum PixelFrame {
  dark('assets/ui/frames/Dark.png'),
  highlighted('assets/ui/frames/Highlighted.png'),
  success('assets/ui/frames/Success.png'),
  warning('assets/ui/frames/Warning.png');

  const PixelFrame(this.assetPath);

  final String assetPath;
}
