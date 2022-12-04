import 'package:flutter/material.dart';

class SlideFadeSwitcher extends StatelessWidget {
  final Widget child;
  const SlideFadeSwitcher({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      child: child,
      transitionBuilder: (child, animation) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: const Offset(0.0, 0.0),
        ).animate(animation);
        final fadeAnimation =
            Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0.5,
            1,
          ),
        ));
        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        );
      },
    );
  }
}
