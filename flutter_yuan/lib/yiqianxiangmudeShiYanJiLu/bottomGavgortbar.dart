import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'page_demo.dart';
import 'layout_demo.dart';

class bottomNavgaotBarDemoState extends StatefulWidget {
  @override
  _bottomNavgaotBarDemoStateState createState() =>
      _bottomNavgaotBarDemoStateState();
}

class _bottomNavgaotBarDemoStateState extends State<bottomNavgaotBarDemoState> {
  List<Widget> jihe = [layout_buju(), page_demo()];

  int _int = 0, i = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("底部卡"),

            bottomOpacity: 0.9, //bottomOpacity 不透明的
          ),
          //floatingActionButton Animator按钮动画
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.access_alarms_outlined),
            onPressed: () {
              print("淑女");
            },
          ),
          body: jihe[_int],
          bottomSheet: layout_buju(),
          //在嵌入时钟的部位插入widget 让时钟插入进去
          bottomNavigationBar:
              /*bottombar(),*/ BottomNavigationBar(
            //默认是 shifting
            type: BottomNavigationBarType.fixed,
            //四个就报错了 要修改成这个
            iconSize: 30,
            //Item集合不能小于二
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "第一个"),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(80.0), //字与图 间距
                    child: Center(child: Icon(Icons.home)),
                  ),
                  label: "第二个"),
            ],
            currentIndex: _int,
            //当前 计数
            onTap: (v) //回调
                {
              setState(() {
                _int = v;
              });
            },
          )),
    );
  }
}

class bottombar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      //primary color 原色
      shape //NotchedShape 切口形状
          : CircularNotchedRectangle() /* CircularNotchedRectangle()*/,
      //shape 形状 CircularNotchedRectangle 圆形
      child: Row(
        //mianAxis 主轴

        children: [
          IconButton(
              icon: Icon(Icons.widgets),
              onPressed: () {
                print("输出");
              }),
          SizedBox(),
          IconButton(
              icon: Icon(Icons.access_time_outlined),
              onPressed: () {
                print("输出");
              }),
          IconButton(
              icon: Icon(Icons.widgets),
              onPressed: () {
                print("输出");
              }),
          SizedBox(),
          IconButton(
              icon: Icon(Icons.access_time_outlined),
              onPressed: () {
                print("输出");
              }),
        ], //Alignment 对齐 space 空间 Around 周围
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}
