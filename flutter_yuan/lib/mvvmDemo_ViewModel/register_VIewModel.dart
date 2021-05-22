import 'package:flutter/material.dart';
import 'package:event/event.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_yuan/eventbus/event_bus.dart';

class RegisterViewModel extends ChangeNotifier {
  bool _loading = false;
  DateTime _dateTime;
  int _gender = 0;
  int _solar = 0;

  int woshihViewModellidezhi = 10;

  void setGender(int v) {
    _gender = v;
  }

  void setSolar(int v) {
    _solar = v;
    notifyListeners();
  }

  bool get getLoading {
    return _loading;
  }

  int get getSolar {
    return _solar;
  }

  int get getGender {
    return _gender;
  }

  void setLoadding(bool value) {
    _loading = value;
  }

  void setDateTime(DateTime date) {
    _dateTime = date;
    notifyListeners();
  }

  String get getDateTime {
    if (_dateTime == null) {
      return "";
    }
    return _dateTime.year.toString() +
        "-" +
        _dateTime.month.toString() +
        "-" +
        _dateTime.day.toString();
  }

  void login(
      String
          user /*, String pass, String name, String phone, String code,
      int gender, String dateTime, int solar*/
      ) {
    setLoadding(true);

    if (true) {
      print("进入验证环节");
      // is Empty user字符串为空
      bus.emit("faill", {
        "view": "login",
        "message": "注册账号不能为空",
      }); //Loadding 加载

      setLoadding(false);

      return;
    }
  }
}
