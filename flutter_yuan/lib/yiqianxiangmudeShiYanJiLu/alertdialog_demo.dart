import 'dart:math';

import 'package:flutter/material.dart';

//废弃  下面alert dialog demo 2 主
class alertdialog_demo extends StatelessWidget {
  const alertdialog_demo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹窗演示"),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: _showAlert,
            child: Text("对话框"),
          ),
/*          RaisedButton(
            onPressed: _showAlert,
            child: Text("列表对话框"),
          )*/
        ],
      ),
    );
  }

  void _showAlert() {
    AlertDialog(
      title: Text("标题"),
      content: Text("内容"), //content内容
      actions: [
        FlatButton(
          onPressed: () {},
          child: Text("确认"),
        ),
        FlatButton(
          onPressed: () {},
          child: Text("取消"),
        )
      ],
    );
  }
}

class alertdialog_demo2 extends StatefulWidget {
  const alertdialog_demo2({Key key}) : super(key: key);

  @override
  _alertdialog_demo2State createState() => _alertdialog_demo2State();
}

class _alertdialog_demo2State extends State<alertdialog_demo2> {
  List<int> liebiao = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 20; i++) {
      liebiao.add(i);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹框"),
      ),
      body: Column(
        children: [
          //stf 活动页面 的context 才是可以到处调用的 静态context
          //不然 context只能写在 widget 里面
          RaisedButton(
            onPressed: _showAlert2, //弹窗要是静态
            child: Text("弹窗"),
          ),
          RaisedButton(
            onPressed: _showDialogdemo3, //弹窗要是静态
            child: Text("列表弹窗"),
          )
        ],
      ),
    );
  }

  void _showAlert2() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //前面加Cupertino IOS风格
            title: Text("标题"),
            content: Text("内容"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); //pop 里的返回值 返回到控制台
                  },
                  child: Text("确定")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, true); //跟上面效果一样的
                  },
                  child: Text("取消"))
            ],
          );
        });
  }

  void _showDialogdemo3() async {
    var result = await showDialog(
      barrierDismissible: true,//点外边不会关闭
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(//简单弹窗
            //show Dialog 里面传一个创建的 context
            title: Text("标题"),
            children: liebiao
                .map(
                  (e) => GestureDetector(
                    //Gesture 手势 Detectior 检测器
                    child: Text(e.toString()),
                    onTap: () {
                      Navigator.pop(context, e);
                    }, //点击
                  ),
                )
                .toList(),
          );
        });
    print(result);
  }
}
