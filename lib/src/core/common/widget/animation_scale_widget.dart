import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationScaleWidget extends StatelessWidget {
  final int position;
  final double horizontalOffset, verticalOffset;
  final Widget child;
  final int milliseconds;

  const AnimationScaleWidget(
      {Key? key,
      this.position = 0,
      this.horizontalOffset = 0,
      this.verticalOffset = 100,
      required this.child,
      this.milliseconds = 400})
      : super(key: key);

  final bool isAnimationActive = true;

  @override
  Widget build(BuildContext context) {
    if (isAnimationActive) {
      return AnimationConfiguration.staggeredList(
        position: position,
        duration: Duration(milliseconds: milliseconds),
        child: SlideAnimation(
          horizontalOffset: horizontalOffset,
          verticalOffset: verticalOffset,
          child: FadeInAnimation(
            child: child,
          ),
        ),
      );
    } else {
      return child;
    }
  }
}
