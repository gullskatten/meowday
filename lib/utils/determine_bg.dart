String determineBackground(DateTime date) {
  var hour = date.hour;
  if (hour < 6) {
    return 'assets/images/at_night_peek.jpg';
  }
  if (hour < 12) {
    return 'assets/images/evening_peek.jpg';
  }
  if (hour < 17) {
    return 'assets/images/landscape_orange_peek.jpg';
  }
  return 'assets/images/evening_peek.jpg';
}