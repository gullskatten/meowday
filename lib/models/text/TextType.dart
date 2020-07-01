enum TextType {
  body, subtitle, title
}

extension TextTypeChecker on TextType {

  bool get isTitleType {
    return this != TextType.body;
  }

  bool get isBodyType {
    return this == TextType.body;
  }
}