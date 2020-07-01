import 'package:flutter/material.dart';


class ExperienceBar extends StatefulWidget {
  final double percent;

  ExperienceBar({@required this.percent});

  @override
  _ExperienceBarState createState() => _ExperienceBarState();
}

class _ExperienceBarState extends State<ExperienceBar>  with SingleTickerProviderStateMixin {

  AnimationController _controller;

  Animation<double> curve;
  Tween<double> valueTween;

  @override
  void initState() {
    super.initState();

    this._controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    this.curve = CurvedAnimation(
      parent: this._controller,
      curve: Curves.easeInOut,
    );

    // Build the initial required tweens.
    this.valueTween = Tween<double>(
      begin: 0,
      end: this.widget.percent,
    );

    this._controller.forward();
  }

  @override
  void didUpdateWidget(ExperienceBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (this.widget.percent != oldWidget.percent) {
      // Try to start with the previous tween's end value. This ensures that we
      // have a smooth transition from where the previous animation reached.
      double beginValue =
          this.valueTween?.evaluate(this.curve) ?? oldWidget?.percent ?? 0;

      // Update the value tween.
      this.valueTween = Tween<double>(
        begin: beginValue,
        end: this.widget.percent ?? 1,
      );

      this._controller
        ..value = 0
        ..forward();
    }
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: this.curve,
        builder: (context, child) {
          return Container(
            height: 25.0,
            child: LinearProgressIndicator(
              value: this.valueTween.evaluate(this.curve) / 100, // percent filled
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white60),
              backgroundColor: Colors.white30,
            ),
          );
        },
    );
  }
}
