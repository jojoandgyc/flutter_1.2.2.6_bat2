import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yuan/mvvmDemo_Model/login.dart';
import 'package:flutter_yuan/mvvmDemo_View/registerView.dart';
import 'package:weui/dialog/index.dart';
import 'package:weui/toast/index.dart';


//ChangeNotifier 全局的静态实列对象
class LoginViewModel_logding extends ChangeNotifier {
  bool _isLogin = false;
  TextEditingController _user;
  TextEditingController _pass;

  //加这个get 就不用再加() 用XX.XX直接调用
  bool get getIsLogin {
    return _isLogin;
  }

  TextEditingController get getUser {
    //text editing 编辑 controller 控制器
    if (_user == null) _user = TextEditingController();
    return _user;
  }

//当做变量 返回
  TextEditingController get getPass {
    //text editing 编辑 controller 控制器
    if (_pass == null) _pass = TextEditingController();
    return _pass;
  }


  void setIsLogin(bool value) {
    _isLogin = value;
    notifyListeners(); //监听 notify 通知
  }


  void Logind(BuildContext context) async {
    print("进入成功" + getUser.text + "用户" + getUser.toString());
    setIsLogin(true);
    if (getUser.text.isEmpty) {
      //弹窗
      WeToast.fail(context)(message: "账户不能为空");
      setIsLogin(false);
      return;
    } else if (getPass.text.isEmpty) {
      WeToast.fail(context)(message: "密码不能为空");
      setIsLogin(false);
      return;
    }
    //Response ruslt =await loginModel(getPass.text,getPass.text);
    if (_pass.text=="110" /*ruslt.data["susste"]*/) { //jons 里是否有这个字典

      Navigator.of(context).popAndPushNamed("menu");
    } else {
      //弹窗
      WeDialog.alert(context)(getUser.text + " 用户不存在 " /*ruslt.data["msg"]*/);
      /**/
      WeDialog.alert(context)("报错方式",
          theme: WeDialogTheme.android,//安卓样式
          /*ruslt.data["msg"]*/);
    }
    setIsLogin(false);
  }
}