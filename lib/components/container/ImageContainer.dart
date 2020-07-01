import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextType.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

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
