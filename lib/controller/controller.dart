import 'package:flutter/material.dart';
import 'package:todoapp/model/user_model.dart';

class Allcontroller extends ChangeNotifier {
  List<User_model> _user_model = [];
  List<User_model> get get_user_model => _user_model;
  set_user_model(List<User_model> model) {
    _user_model = model;
    notifyListeners();
  }

  //  Add Data
  add_user_model(User_model model) {
    _user_model.add(model);
    notifyListeners();
  }

  updatedata(User_model update) {
    final data = _user_model.indexWhere((element) => element.id == update.id);
    _user_model[data] = update;
    notifyListeners();
  }
}
