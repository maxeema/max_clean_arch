//

extension DurationIntX on int {
  Duration get ms => Duration(milliseconds: this); //
  Duration get sec => Duration(seconds: this); //
}

extension DurationFutureX on Duration {
  Future<void> get delay => Future.delayed(this);
}
