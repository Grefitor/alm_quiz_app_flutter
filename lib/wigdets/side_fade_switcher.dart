import 'package:flutter/material.dart';
class SideFadeSwitcher extends StatelessWidget {
  final Widget child;
  const SideFadeSwitcher({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 400),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeIn,
      child: child,
      transitionBuilder: (child, animation) {
        final sizedAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(
              0.0,
              0.5,
            ),
          )
        );
        final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: const Interval(
                0.5,
                1,
              ),
            )
        );
        return FadeTransition(
          opacity: fadeAnimation,
          child: SizeTransition(
            sizeFactor: sizedAnimation,
            child: child,
          ),
        );
      },
    );
  }
}
