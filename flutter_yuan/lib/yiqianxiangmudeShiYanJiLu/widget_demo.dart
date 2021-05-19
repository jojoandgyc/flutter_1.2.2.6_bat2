import 'package:flutter/material.dart';

class widget_demo extends StatelessWidget {
  @override //  创建的上下文
  Widget build(BuildContext Ccontext) {
    return Scaffold(
      //手脚架
      appBar: AppBar(
        //导航栏
        title: Text("导航栏 登录"),
      ),
      body: RaisedButton(
        child: Text("登录"),
        onPressed: () async {
          //异步操作
          //导航家   等待Navigator返回  这个窗口的上下文   Materal 材料  包  Route 路线
          var sdsd = await Navigator.of(Ccontext)
              .push(
            MaterialPageRoute(
              builder: (context) {
                //builder 建设 上下文
                return menuopage();
              }, //设置  该窗口的 路由信息 名称 是否为首页 （首页跳转完右上角不会有<-退回标志）
              settings: RouteSettings(
                name: "路称", //路由名称
                arguments: '1路值2', //传值 arguments 自变数
              ), //settings 设置 / 环境
              maintainState: true, //miantain 维持 关闭后路由跳转接收页面
              fullscreenDialog: false, //是否为全屏 fullscreen 全屏 Dialog 对话
              //true 页面从下面网上出来 false 页面从右侧出来
            ),
          ) //d 进入 一框就 会返回
              .then((value) => print("一框的返回值")); //then 然后
          print("一框输出"); //当sdsd 导航器 有返回值时 不能直接输出
        },
      ),
    );

    /*Container(
      color: Colors.deepPurpleAccent,
    );*/
  }
}

//  menu 菜单 opage 操作
class menuopage extends StatelessWidget {
  /*final String tilil;

//         required 需要   调用这组件的时候 这个参必传
  const menuopage({Key key, @required this.tilil}) : super(key: key);
*/
  @override
  Widget build(BuildContext context) {
//dynamic 动态的 arguments 参数 Modal模拟      接收路由传参
    dynamic arguments = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
      //手脚架
      appBar: AppBar(
        // 传来的MAP 值 要 tosting 转成字符串
        title: Text("=." + arguments + "="),
      ),
      body: RaisedButton(
        //按钮文本主题   accent 强调
        textTheme: ButtonTextTheme.accent,
        child: Text("第二按钮 "),
        onPressed: () {
          //                     pop 可以返回 objt 任意类型
          Navigator.of(context)
              .popAndPushNamed("cod", arguments: "菜单")
              .then((value) => print("第二页的返回值"));

          /* Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return menuopage1(
              tilil: "去到第三个页面",
            );
          })); */ // 跳转回到主界面
          /*    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return widget_demo();
          })
          )
          ;*/
        },
        textColor: Colors.lightGreen,
      ),
    );
    /*Container(
      color: Colors.deepPurpleAccent,
    );*/
  }
}

//  menu 菜单 opage 操作
class menuopage1 extends StatelessWidget {
  /* final String tilil;

//         required 需要   调用这组件的时候 这个参必传
  const menuopage1({Key key, @required this.tilil}) : super(key: key);
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //手脚架
        appBar: AppBar(
          title: Text("第三页"),
        ),
        body: RaisedButton(
            textTheme: ButtonTextTheme.accent,
            child: Text("菜单的按钮"),
            onPressed: () {
              // Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return widget_demo();
                },
                fullscreenDialog: false,
              ));

//                     pop 可以返回 objt 任意类型
              /*Navigator.of(context).pop();*/ // 跳转回到主界面
              /*       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return widget_demo();*/
            }));
    /*;

        },
        textColor: Colors.lightGreen,
      ),
    );*/
    /*Container(
      color: Colors.deepPurpleAccent,
    );*/
  }
}

class ConstrainedBoxdemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 20,
        minWidth: 20,
        maxHeight: 50,
        maxWidth: 50,
      ), //Constraints 约束
      child: Container(
        child: Container(
          child: Container(),
        ),
      ),
    );
  }
}

class Boxdemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //Sized 特定大小
      //只使用 SizedBox 大小
      height: 101,
      width: 101,
      child: Container(
        width: 1000, //无效设置
        height: 1000,
      ),
    );
  }
}

class DecorateBoxdemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.all(50),//margin 内边距
      height: 200,
      width: 200,
      color: Colors.black,
      child:  DecoratedBox(

        decoration: BoxDecoration(

          boxShadow: [BoxShadow(
            //shadow 阴影
            color: Colors.limeAccent,
            offset: Offset(1,1),//阴影方位
            blurRadius: 3,//阴影大小
          )
          ],
          //Border 边界 radius半径
          borderRadius: BorderRadius.circular(12.1), //circular 通知
          gradient: LinearGradient(
            //线性 Linear
            colors: [
              Colors.white,
              Colors.limeAccent,
              Colors.lightBlueAccent,
            ],
          )
          , //gradinet 梯度 平行渐变渐变
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 40,
            bottom: 40,
          ),
          child: Text(

            "注册",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ),

    ) ;

  }
}
class Containerdemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(//前景
      ),
      decoration: BoxDecoration(),//背景
    transform: Matrix4.rotationX(0.5),// trans 变压器 Matrix 矩形 rotation 旋转
    );
  }
}
