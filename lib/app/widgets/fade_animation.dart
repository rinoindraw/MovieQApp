import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimationType { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  // ignore: use_key_in_widget_constructors
  const FadeAnimation({required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    final movieTween = MovieTween()
      ..tween(AnimationType.opacity, Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn)
      ..tween(AnimationType.translateY, Tween(begin: -30.0, end: 1.0),
          duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);

    return PlayAnimationBuilder<Movie>(
      tween: movieTween,
      delay: Duration(milliseconds: delay.round()),
      duration: movieTween.duration,
      onStarted: () => debugPrint('onStart'),
      onCompleted: () => debugPrint('onComplete'),
      child: child,
      builder: (context, value, child) {
        return Opacity(
          opacity: value.get(AnimationType.opacity),
          child: Transform.translate(
              offset: Offset(0, value.get(AnimationType.translateY)),
              child: child),
        );
      },
    );
  }
}
