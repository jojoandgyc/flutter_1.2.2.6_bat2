import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_yuan/eventbus/event_bus.dart';
import 'package:flutter_yuan/mvvmDemo_ViewModel/register_VIewModel.dart';
import 'package:provider/provider.dart';
import 'package:weui/button/index.dart';
import 'package:weui/cell/index.dart';
import 'package:weui/form/index.dart';
import 'package:weui/input/index.dart';
import 'package:weui/switch/index.dart';
import 'package:weui/toast/index.dart';

import '../main.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController _user;
  TextEditingController _pass;
  TextEditingController _phone;
  TextEditingController _code;
  TextEditingController _name;
  DateTime _dateTime;
  int _gender = 0; //0=男 1=女
  int _solar = 0; //0=阳历 1=阴历/农历
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _user = TextEditingController();
    _pass = TextEditingController();
    _phone = TextEditingController();
    _code = TextEditingController();
    _name = TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _user.dispose();
    _pass.dispose();
    _phone.dispose();
    _code.dispose();
    _name.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {

        bus.on("faill", (arg) {//arg 自变量 当前界面的上下文
          print("进入bus处理事件");
          if(arg["view"]=="login"){//当前页面 名字为 mvvm里View login
            WeToast.fail(context)(message:arg["message"]);
          }
        });

    });
    var regist = Provider.of<RegisterViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("注册界面"),
      ),
      body: WeForm(
        children: [
          WeInput(
            label: "账号",
            hintText: "请出入注册账号",
            textInputAction: TextInputAction.next,
            clearable: true,
            onChange: (v){
              _user.text=v;
            },
          ),
          WeInput(
            label: "手机号",
            hintText: "请出入手机号",
            textInputAction: TextInputAction.next,
            type: TextInputType.phone,
            onChange: (v){
              _phone.text=v;
            },
            footer: WeButton(
              "获取验证码",
              theme: WeButtonType.primary,
              size: WeButtonSize.mini,
            ),
          ),
          WeInput(
            label: "验证码",
            hintText: "请输入验证码",
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
            onChange: (v){
              _name.text=v;
            },
            footer: Row(
              children: [
                Switch(
                  value: regist.getGender == 0 ? false : true,
                  onChanged: (v) {
                    setState(() {
                      regist.setGender(v ? 1 : 0) ;
                    });
                  },
                ),
/*                WeSwitch(
                  checked: _gender,
                  size: 20,
                )*/
                SizedBox(
                  width: 8,
                ),
                Text(regist.getGender ==0?"男":"女"),
              ],
            ),
          ),
          WeCell(
            //cell 单元格
            label: "出生日期",
            content: regist.getDateTime,
            footer: Row(
              children: [
                WeSwitch(
                  size: 20,
                  onChange: (v){
                    regist.setSolar(v?1:0) ;
                    //在setState里 会自动调用 notifyListeners
/*                    setState(() {//在set里才会 刷新
                    });*/
                  },
                ),
                SizedBox(
                  width: 8,
                ),
                Text(regist.getSolar ==0 ?"阴历":"阳历"),
              ],
            ),
            onClick: ()async{// picker 选择器
              DatePicker.showDatePicker(
                context,showTitleActions: true,
                minTime: DateTime(1970,1,1),
                maxTime: DateTime(2077,12,31),
                onChanged: (date){
                  regist.setDateTime(date);
                },onConfirm: (date){
                  print("点击事件下产生"+date.year.toString());
              },
                currentTime: DateTime.now(),
                locale: LocaleType.zh,//locale 场所 地点 语言环境
              );
            },
          ),
          Container(
            //Container 容器
            margin: EdgeInsets.all(20),
            child: WeButton(
              "注册",
              loading: regist.getLoading,
              theme: WeButtonType.primary,
              onClick: () {
                setState(() {
                  regist.login(_user.toString());

                });

              },
            ),
          )
        ],
      ),
    );
  }

  void _alertDateTime() async {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        _dateTime = value;
      });
    }).catchError((e) {
      print(e);
    });
  }

  void _getCode() {
    setState(() {
      count = 60;
    });
    _task();
  }

  void _task() {
    Future.delayed(new Duration(seconds: 1), () {
      setState(() {
        count--;
        if (count > 0) {
          _task();
        }
      });
    });
  }

/*
  void _register() {
    if (_user.text == null || _user.text.isEmpty) {
      EasyLoading.showError("账号不能为空！");
      return;
    } else if (_pass.text == null || _pass.text.isEmpty) {
      EasyLoading.showError("密码不能为空！");
      return;
    } else if (_name.text == null || _name.text.isEmpty) {
      EasyLoading.showError("姓名不能为空！");
      return;
    } else if (_phone.text == null || _phone.text.isEmpty) {
      EasyLoading.showError("手机号不能为空！");
      return;
    } else if (_code.text == null || _code.text.isEmpty) {
      EasyLoading.showError("验证码不能为空！");
      return;
    } else if (_dateTime == null) {
      EasyLoading.showError("生日不能为空！");
      return;
    }
*/
/*    context.read<RegisterViewmodel>().login(
      _user.text,
      _pass.text,
      _name.text,
      _phone.text,
      _code.text,
      _gender,
      getYMD(_dateTime),
      _solar,
    );*/ /*

  }
*/
}
