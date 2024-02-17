import '/constants/spacing/spacing.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final ImageProvider image;
  final Widget child;

  ImageContainer(this.image, {@required this.child});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Colors.white60, BlendMode.darken),
        ),
      ),

      child: Padding(
        padding: EdgeInsets.all(kSpacingLarge),
        child: child,
      ),
    );
  }
}
