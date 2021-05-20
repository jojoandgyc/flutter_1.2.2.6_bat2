import 'package:flutter/material.dart';
import 'package:weui/button/index.dart';
import 'package:weui/cell/index.dart';
import 'package:weui/form/index.dart';
import 'package:weui/input/index.dart';
import 'package:weui/switch/index.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册界面"),
      ),
      body: WeForm(
        children: [
          WeInput(
            label: "账号",
            hintText: "请出入注册账号",
            clearable: true,
            textInputAction: TextInputAction.next,
          ),
          WeInput(
            label: "手机号",
            hintText: "请出入手机号",
            textInputAction: TextInputAction.next,
            type: TextInputType.phone,
            footer: WeButton(
              "获取验证码",
              theme: WeButtonType.primary,
              size: WeButtonSize.mini,
            ),
          ),
          WeInput(
            label: "验证码",
            hintText: "请输出验证码",
/*            style: TextStyle.lerp(TextStyle(
                backgroundColor: Colors.blueAccent),
                TextStyle(backgroundColor: Colors.yellow),
                3),*/
            textInputAction: TextInputAction.next,
            type: TextInputType.name,
            clearable: true,
            obscureText: true, //输入保密
          ),
          WeInput(
            label: "ID",
            hintText: "请输出用户ID",

            textInputAction: TextInputAction.next,
            type: TextInputType.name,
            footer: Row(
              children: [
                WeSwitch(size: 20,),
                SizedBox(
                  width: 8,
                ),
                Text("男")
              ],
            ),
          ),
          WeCell(
            //cell 单元格
            label: "出生日期",
            content: "",
            footer: Row(
              children: [
                WeSwitch(size: 20,),
                SizedBox(
                  width: 8,
                ),
                Text("阳历"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: WeButton(
              "注册",
              theme: WeButtonType.primary,
            ),
          )
        ],
      ),
    );
  }
}
