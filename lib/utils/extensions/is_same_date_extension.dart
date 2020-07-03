extension IsSameDateExtension on DateTime {
  bool isSameDate(DateTime other) {
    if(other == null && this != null) {
      return false;
    } else if (other != null && this == null) {
      return false;
    } else if (other == null && this == null) {
      return true;
    }

    return this.year == other.year && this.month == other.month
        && this.day == other.day;
  }
}