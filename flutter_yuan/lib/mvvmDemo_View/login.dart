import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_yuan/base/login_getAPPbar.dart';
import 'package:flutter_yuan/eventbus/event_bus.dart';
import 'package:flutter_yuan/mvvmDemo_ViewModel/login_mvvmviewmodel.dart';
import 'package:flutter_yuan/utils_rsa/tuils.dart';
import 'package:provider/provider.dart';
import 'package:weui/button/index.dart';
import 'package:weui/form/index.dart';
import 'package:weui/input/index.dart';
import 'package:weui/toast/index.dart';

class login extends StatefulWidget {
  const login({Key key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  int _a;
  TextEditingController _user;
  TextEditingController _pass;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _user= new TextEditingController();
     _pass= new TextEditingController();
     //注册订阅事件  EventCallback 回调事件 返回当前页面上下文
    bus.on("fail", (arg) {//arg 自变量 当前界面的上下文
      print("进入bus处理事件");
      if(arg["view"]=="login"){//当前页面 名字为 mvvm里View login
        WeToast.fail(context)(message:arg["message"]);
      }
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
/*  被事件event总线bus 替代 eventbus*//*
    Provider.of<LoginViewModel_logding>(context,listen: false).getUser.dispose();
    Provider.of<LoginViewModel_logding>(context,listen: false).getPass.dispose();*/
    _pass.dispose();
    _user.dispose();
    bus.off("fail");//关闭 订阅后 再使用此订阅不会再有 消息返回
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAPPbar("登录"),
      body: Wrap(
        spacing: 0.0, // 主轴(水平)方向间距
        runSpacing: 4.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.center, //沿主轴方向居中
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 3, bottom: 0),
            child: Image.asset(
              "images/msa.jpg",
              width: double.infinity,
              height: 400,
              fit: BoxFit.fill,
            ),
          ),
/*          Image.asset(
            "images/msa.jpg",
            width: double.infinity,
            height: 500,
            fit: BoxFit.fill,
          ),*/
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              child: TextField(
                controller:_user,//接收文本
                    //Provider.of<LoginViewModel_logding>(context,listen: false).getUser,
                //text field 文本对象  Flutter自带组件
                decoration: InputDecoration(
                  //decoration 装饰
                  labelText: "账户",
                  hintText: "请输入账户",
                  prefix: Icon(Icons.person), //左侧按钮
                ),
                autofocus: false, //自动获取焦点
                textInputAction: TextInputAction.next,
              )),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
            child: TextField(
              controller: _pass,//Provider.of<LoginViewModel_logding>(context,listen: false).getPass,
              //text field 文本对象  Flutter自带组件
              decoration: InputDecoration(
                //decoration 装饰
                labelText: "密码",
                hintText: "请输入密码",
                prefix: Icon(Icons.lock), //左侧按钮
              ),
              autofocus: false,
              //自动获取焦点
           //   textInputAction: TextInputAction.send,
                onSubmitted: (e) {//onSubmitted 按回车的回调
                print("按下回车发生的回调事件");
                Denglu();//无效
              },
            ),
          ),
          GestureDetector(
            //Gestures 手势 Detector 探测器
            child: Container(
              width: double.infinity,
              child: Text(
                "找回密码",
                style: TextStyle(color: Colors.blueAccent),
                textAlign: TextAlign.right, //处于最右侧
              ),
            ),
            onTap: () {
              print("找回密码事件");
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            WeButton(
              "登录", // 全局  of 在 <类型>        传哪里  本页面控制块
              size: WeButtonSize.mini,//     在类似的写法中 不需要更改状态 写成这样安全
              loading: Provider.of<LoginViewModel_logding>(context,listen: false).getIsLogin,
              theme: WeButtonType.primary,
              onClick: () {
                print("登录点击事件");
                _a = 1;
                _login();
              },
            ),
            WeButton(
              "注册", // 全局  of 在 <类型>        传哪里  本页面控制块
              // loading: Provider.of<LoginViewModel_logding>(context).getIsLogin,
              theme: WeButtonType.primary,
              size: WeButtonSize.mini,
              onClick: () {
                print("注册点击事件");
                _a = 2;
                Navigator.of(context).popAndPushNamed("register");
              },
            ),
          ]),
          //Denglu(),
        ],
      ),
      /*Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              "images/msa.jpg",
              width: double.infinity,
              height: 500,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 3,
            ),
*/
      /*            WeForm(children: [        微信组件
              WeInput(
                label: "账号",
                hintText: "请输入你的账号",//提示
                clearable: true,//clearable 可清除的
                textInputAction: TextInputAction.next,//输入跳到下一个

              ),
              WeInput(
                label: "密码",
                hintText: "请输入你的密码",//提示
              ),

            ])*/
      /*
            TextField(
              //text field 文本对象  Flutter自带组件
              decoration: InputDecoration(
                //decoration 装饰
                labelText: "账户",
                hintText: "请输入账户",
                prefix: Icon(Icons.person), //左侧按钮
              ),
              autofocus: true,//自动获取焦点
              textInputAction: TextInputAction.next,
            ),
            TextField(
              //text field 文本对象  Flutter自带组件
              decoration: InputDecoration(
                //decoration 装饰
                labelText: "密码",
                hintText: "请输入密码",
                prefix: Icon(Icons.lock), //左侧按钮
              ),
              autofocus: true,//自动获取焦点
              textInputAction: TextInputAction.send,

            ),

            Denglu(),
          ],
        ),
      )*/
    );
  }

  void _login() {
// 在当前上下文读取  Provider    在viewmodel 中转层    上下文传进去    这句有问题
    context.read<LoginViewModel_logding>().Logind(_user.text,_pass.text);
    print("Login执行结束");
/*    new Timer(Duration(seconds: 2), () {
      //释放 二值信号量
      context.read <LoginViewModel_logding>().setIsLogin(false);
      if (_a == 1) {
        Navigator.of(context).pushNamed("menu");
        //跳转完 在下一个活动页里 这页的内容 不会输出被捕获
        print(Provider.of<LoginViewModel_logding>(context).getUser);
      } else if (_a == 2) {
        Navigator.of(context).pushNamed("register");
      } else {
        print("无效");
      }
    });*/
  }


}

class Denglu extends StatelessWidget {
  const Denglu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WeButton(
      "回调", // 全局  of 在 <类型>        传哪里  本页面控制块
      loading: Provider.of<LoginViewModel_logding>(context,listen: false).getIsLogin,
      theme: WeButtonType.primary,
      onClick: () {
        print("回调");
      },
    );
    /*RaisedButton(
        child: Text("登录"),

        textColor: Colors.amber,
        onPressed: () {
          print(encodeString("123456"));
        });*/
  }
}
