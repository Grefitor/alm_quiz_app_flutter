import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget child;
  const AnimatedButton({
    Key? key,
    required this.child,
    this.onTap
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    animation = Tween(begin: 1.0, end: 0.9).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: widget.onTap != null ? (_) {
        animationController.forward();
      }: null,

      onTapUp: widget.onTap != null ? (_) {
        animationController.reverse();
      }: null,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (_, __) {
          return Transform.scale(
            scale: animation.value,
            child: widget.child,
          );
        },
      )
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
