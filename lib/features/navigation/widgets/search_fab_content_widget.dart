import 'package:flutter/material.dart';

const _expandedWidgetSideOffset = 75.0;

//TODO maybe extract the business logic for SearchFab, SearchFabContentWidget, and NavigationPage to a bloc?
// Like to create a SearchFabBloc that will depend on NavigationBloc...
class SearchFabContentWidget extends StatefulWidget {
  const SearchFabContentWidget({
    this.initialOpen,
    this.onClosed,
    required this.fabBuilder,
    required this.expandedBuilder,
    Key? key,
  }) : super(key: key);

  final bool? initialOpen;
  final VoidCallback? onClosed;
  final Widget Function(BuildContext context, bool isOpen) fabBuilder;
  final Widget Function(BuildContext context, bool isOpen) expandedBuilder;

  @override
  SearchFabContentState createState() => SearchFabContentState();
}

class SearchFabContentState extends State<SearchFabContentWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;

  bool _open = false; //
  bool get open => _open;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
        widget.onClosed?.call();
      }
    });
  }

  void close() {
    if (_open) {
      setState(() {
        _open = false;
      });
      _controller.reverse();
      widget.onClosed?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _ExpandingWidget(
            key: ValueKey(_open),
            child: widget.expandedBuilder(context, _open),
            progress: _expandAnimation,
          ),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToOpenFab() {
    return AnimatedScale(
      scale: _open ? 0.85 : 1.0,
      curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
      duration: const Duration(milliseconds: 250),
      child: widget.fabBuilder(context, _open),
    );
  }
}

class _ExpandingWidget extends StatelessWidget {
  const _ExpandingWidget({
    Key? key,
    required this.progress,
    required this.child,
  }) : super(key: key);

  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(progress.value * -_expandedWidgetSideOffset, 0),
          child: child,
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}
