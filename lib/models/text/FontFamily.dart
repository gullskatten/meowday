

enum FontFamily {
  body, title, alternative, handwriting
}

extension FontFamilies on FontFamily {

  String get family {
    switch(this) {
      case FontFamily.body:
        return 'PatrickHand';
      case FontFamily.title:
        return 'PatrickHand';
      case FontFamily.alternative:
        return 'Pacifico';
      case FontFamily.handwriting:
        return 'PatrickHand';
      default:
        return 'Raleway';
    }
  }
}