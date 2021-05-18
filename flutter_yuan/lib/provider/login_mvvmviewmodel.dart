import 'package:flutter/material.dart';
class LoginViewModel_logding extends  ChangeNotifier {
  bool _isLogin=false;
  TextEditingController _user;
  TextEditingController _pass;

  //加这个get 就不用再加() 用XX.XX直接调用
  bool  get getIsLogin{
  return _isLogin;
  }

  TextEditingController get  getUser {
    //text editing 编辑 controller 控制器
    if (_user == null) _pass = TextEditingController();
    return _user;
  }
//当做变量 返回
  TextEditingController get  getPass {
    //text editing 编辑 controller 控制器
    if (_pass == null) _pass = TextEditingController();
    return _pass;
  }


  void setIsLogin(bool value){
    _isLogin =value;
    notifyListeners();//监听 notify 通知

  }
}