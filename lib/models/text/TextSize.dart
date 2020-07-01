import 'package:app/constants/text/text_styles.dart';
import 'package:app/models/text/TextType.dart';

enum TextSize { smaller, normal, bigger }

extension TextSizes on TextSize {
  double _determineSizeForBody() {
    switch (this) {
      case TextSize.bigger:
        return kBodyLarger;
      case TextSize.smaller:
        return kBodySmaller;
      case TextSize.normal:
      default:
        return kBodyNormal;
    }
  }

  double _determineSizeForSubtitle() {
    switch (this) {
      case TextSize.bigger:
        return kSubtitleLarger;
      case TextSize.smaller:
        return kSubtitleSmaller;
      case TextSize.normal:
      default:
        return kSubtitleNormal;
    }
  }

  double _determineSizeForTitle() {
    switch (this) {
      case TextSize.bigger:
        return kTitleLarger;
      case TextSize.smaller:
        return kTitleSmaller;
      case TextSize.normal:
      default:
        return kTitleNormal;
    }
  }

  double getSizeBasedOnVariant(TextType textType) {
    switch (textType) {
      case TextType.body:
        return _determineSizeForBody();
      case TextType.subtitle:
        return _determineSizeForSubtitle();
      case TextType.title:
        return _determineSizeForTitle();
      default:
        return _determineSizeForBody();
    }
  }
}
