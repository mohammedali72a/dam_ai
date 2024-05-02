import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AnimatedShimmer extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Color highlightColor;
  final Color baseColor;

  AnimatedShimmer({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 2000),
    this.delay = const Duration(milliseconds: 0),
    this.highlightColor = const Color.fromARGB(255, 19, 83, 187),
    this.baseColor = const Color.fromARGB(255, 189, 69, 241),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: duration + delay,
      highlightColor: highlightColor,
      baseColor: baseColor,
      child: child,
    );
  }
}
