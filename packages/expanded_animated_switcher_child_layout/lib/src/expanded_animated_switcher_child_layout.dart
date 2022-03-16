import 'package:flutter/material.dart';

// Used with AnimatedSwitcher's layoutBuilder to expands child content with available width and height
// Usually, we define custom layout builder to fully expand a child vertically.
// It's actual for small amount of data like just 2 or 3 products that consume a half of screen.
// But using this layout our content will retain all available space
class ExpandedAnimatedSwitcherChildLayout extends StatelessWidget {
  const ExpandedAnimatedSwitcherChildLayout(this.currentChild, this.previousChildren, {this.alignment = Alignment.center, Key? key})
      : super(key: key);

  final Widget? currentChild;
  final List<Widget> previousChildren;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: alignment,
      children: <Widget>[
        ...previousChildren,
        if (currentChild != null) currentChild!,
      ],
    );
  }
}
