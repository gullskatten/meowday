import 'package:flutter/material.dart';

class SlideWithFadeInTransition extends StatefulWidget {
  final Widget child;
  final int delay;
  final String id;
  final Curve curve;
  final Offset offset;

  SlideWithFadeInTransition({@required this.child, @required this.id, this.delay, this.curve, this.offset = const Offset(-0.25, 0)});

  @override
  SlideWithFadeInTransitionState createState() => SlideWithFadeInTransitionState();
}

class SlideWithFadeInTransitionState extends State<SlideWithFadeInTransition> with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;
  bool _disposed = false;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    final _curve = CurvedAnimation(curve: widget.curve != null ? widget.curve : Curves.decelerate, parent: _animController);
    _animOffset = Tween<Offset>(begin: widget.offset, end: Offset.zero).animate(_curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      _animController.reset();
      Future.delayed(Duration(milliseconds: widget.delay), () {
       if(!_disposed) _animController.forward();
      });
    }
  }

  @override
  void didUpdateWidget(SlideWithFadeInTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != oldWidget.id) {
      _animController.reset();
      Future.delayed(Duration(milliseconds: widget.delay), () {
        if(!_disposed) _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(position: _animOffset, child: widget.child),
      opacity: _animController,
    );
  }
}