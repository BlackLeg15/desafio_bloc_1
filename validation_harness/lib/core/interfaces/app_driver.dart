abstract class AppDriver {
  Future<void> launchApp();
  Future<void> waitForVisible(String selector, {Duration timeout});
  Future<void> tap(String selector);
  Future<void> scroll(String selector, {double delta = -300});
  Future<bool> isVisible(String selector);
  Future<void> closeApp();
}
