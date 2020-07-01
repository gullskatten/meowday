String greet(DateTime date) {
  var hour = date.hour;
  if (hour < 6) {
    return 'Glad to see you so late';
  }
  if (hour < 12) {
    return 'Good morning';
  }
  if (hour < 17) {
    return 'Good afternoon';
  }
  return 'Good evening';
}