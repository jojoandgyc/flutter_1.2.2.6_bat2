import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yuan/eventbus/event_bus.dart';
import 'package:flutter_yuan/main.dart';
import 'package:flutter_yuan/mvvmDemo_Model/login.dart';
import 'package:flutter_yuan/mvvmDemo_View/registerView.dart';
import 'package:weui/dialog/index.dart';
import 'package:weui/toast/index.dart';
import 'package:event/event.dart';

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

  void Logind(String zhanghao,String mima/*BuildContext context*/) async {
    print("进入Logind" + zhanghao.toString() + "用户" + mima.toString());
    setIsLogin(true);
    if (zhanghao.isEmpty) {
      //弹窗
      //   WeToast.fail(context)(message: "账户不能为空");
      print("账号为空");//emit 发送
      bus.emit("fail", {//这里是一个字典
        "view": "login",
        "message": "账号不能为空",
      });
      setIsLogin(false);
      return;
    } else if (mima.isEmpty) {
      //  WeToast.fail(context)(message: "密码不能为空");
      setIsLogin(false);
      bus.emit("fail", {//emit 发出
        "view": "login",
        "message": "账号不能为空",
      });
      return;
    }
    //Response ruslt =await loginModel(getPass.text,getPass.text);
    if (mima=="110"/*_pass.text === "110"*/ /*ruslt.data["susste"]*/) {
      //jons 里是否有这个字典
//          navigatorKey 是项目唯一的  current当前
      print("进入主页跳转");
      Navigator.of(navigatorKey.currentContext).popAndPushNamed("menu");
    } else {
      bus.emit("fail", {"view": "login", "message": "ruslt['msg']"});
      //弹窗
      //  WeDialog.alert(context)(getUser.text + " 用户不存在 " /*ruslt.data["msg"]*/);
      /**/
      //  WeDialog.alert(context)("报错方式",
      /*    theme: WeDialogTheme.android,//安卓样式
          */ /*ruslt.data["msg"]*/ /*);*/
    }
    setIsLogin(false);
  }
}
