import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AnimatedShimmer extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;

  const AnimatedShimmer({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 2000),
    this.delay = const Duration(milliseconds: 0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: duration + delay,
      highlightColor: const Color.fromARGB(255, 9, 103, 254).withOpacity(.3),
      baseColor: const Color.fromARGB(255, 189, 69, 241),
      child: child,
    );
  }
}
