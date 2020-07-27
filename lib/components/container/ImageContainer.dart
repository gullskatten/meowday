import 'package:app/constants/spacing/spacing.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final ImageProvider image;
  final Widget child;

  ImageContainer(this.image, {this.child});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white60, BlendMode.darken),
        ),
      ),
    );
  }
}
