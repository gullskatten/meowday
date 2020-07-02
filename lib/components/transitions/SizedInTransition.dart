import 'package:flutter/material.dart';

class SizedInTransition extends StatefulWidget {
  final Widget child;
  final int delay;
  final String id;
  final Curve curve;
  final double begin;
  final double end;

  SizedInTransition({@required this.child, @required this.id, this.delay, this.curve, this.begin = 2.0, this.end = 1.0, });

  @override
  SizedInTransitionState createState() => SizedInTransitionState();
}

class SizedInTransitionState extends State<SizedInTransition> with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<double> _animSize;
  bool _disposed = false;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    final _curve = CurvedAnimation(curve: widget.curve != null ? widget.curve : Curves.decelerate, parent: _animController);
    _animSize = Tween<double>(begin: widget.begin, end: widget.end).animate(_curve);
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
  void didUpdateWidget(SizedInTransition oldWidget) {
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
    return SizeTransition(sizeFactor: _animSize, child: widget.child);
  }
}