import 'package:flutter/foundation.dart';

class FavoritModel extends ChangeNotifier {
  final Set<String> _layananFavorit = {};

  Set<String> get layananFavorit => _layananFavorit;

  bool isFavorit(String namaLayanan) {
    return _layananFavorit.contains(namaLayanan);
  }

  void tandai(String namaLayanan) {
    _layananFavorit.add(namaLayanan);
    notifyListeners();
  }

  void batalTandai(String namaLayanan) {
    _layananFavorit.remove(namaLayanan);
    notifyListeners();
  }
}