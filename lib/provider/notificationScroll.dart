import 'package:flutter/cupertino.dart';

class ScrollEventNotifier extends ChangeNotifier {
  bool _isScrolling = false;
  ScrollEventNotifier(this._isScrolling);
  get isScrolling => _isScrolling;
  set isScrolling(bool scrollStatus) {
    _isScrolling = scrollStatus;
    notifyListeners();
  }
}
