//
// Contains all of the shared/important state between widgets.
//

import 'package:flutter/widgets.dart';

class CoreState extends ChangeNotifier {
  String signedInAccountName = "";
  double money = 0;
  final List<double> _loans = [];

  void setSignedInAccount(String accountName) {
    signedInAccountName = accountName;
    notifyListeners();
  }

  void setMoney(double newValue) {
    money = newValue;
    notifyListeners();
  }

  void newLoan(double amount) {
    _loans.add(amount);
    notifyListeners();
  }

  void popLoan() {
    try {
    _loans.removeLast();
    } catch (e) {}
    notifyListeners();
  }

  List<double> get loans {
    return _loans;
  }

  void resetStates() {
    _loans.clear();
    money = 0;
    signedInAccountName = "";
    notifyListeners();
  }

}