import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  List<String> _urlImages = [];
  bool _isDragging = false;
  Size _screenSize = Size.zero;
  List<String> get urlImages => _urlImages;
  double _angle = 0;

  Offset _position = Offset.zero;
  Offset get position => _position;
  bool get isDragging => _isDragging;
  double get angle => _angle;

  void setScreenSize(Size screenSize) => _screenSize = screenSize;
  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;
    notifyListeners();
  }

  void endPosition() {
    resetPosition();
  }

  CardProvider() {
    resetUsers();
  }

  void resetUsers() {
    _urlImages = <String>[
      'https://unsplash.com/s/photos/jpg'
          'https://unsplash.com/s/photos/jpg'
          'https://unsplash.com/s/photos/jpg'
          'https://unsplash.com/s/photos/jpg'
          'https://unsplash.com/s/photos/jpg'
          'https://unsplash.com/s/photos/jpg'
          'https://unsplash.com/s/photos/jpg'
    ].reversed.toList();
    notifyListeners();
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;
    notifyListeners();
  }
}
