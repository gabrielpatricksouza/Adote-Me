import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final bool isCollapsed;
  final double screenWidth;
  final Duration duration;
  final Animation<double> scaleAnimation;
  final Function onMenuTap;
  final Widget child;

  const Dashboard({
    Key key,
    this.isCollapsed,
    this.screenWidth,
    this.duration,
    this.scaleAnimation,
    this.onMenuTap,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: isCollapsed ? 0 : 80,
      bottom: isCollapsed ? 0 : 80,
      left: isCollapsed ? 0 : 0.5 * screenWidth,
      right: isCollapsed ? 0 : -0.35 * screenWidth,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          elevation: 10,
          child: child,
        ),
      ),
    );
  }
}
