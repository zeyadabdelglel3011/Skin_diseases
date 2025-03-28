import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../ScanModel.dart';

class ScanProvider with ChangeNotifier {


  List<ScanModel> _carts = [];

  // getter for carts
  List<ScanModel> get carts => _carts;

  // setter for _carts
  set carts(List<ScanModel> carts) {
    _carts = carts;
    notifyListeners();
  }
}