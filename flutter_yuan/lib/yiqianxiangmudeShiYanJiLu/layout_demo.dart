import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class layout_demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局"),
      ),
      body: layout_buju(),
    );
  }
}

class layout_buju extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Flex //弹性布局
          (
        direction: Axis.horizontal, //默认要传入一个方向  dirrction 方向
        children: [
          Expanded(
            child: Container(
              color: Colors.yellow,
              width: 100,
              height: 100,
            ),
            flex: 1, //权重 剩余空间将被装满
          ),
          Container(
            color: Colors.yellow,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.deepPurple,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.black26,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.cyan,
            width: 100,
            height: 100,
          ),
        ], //传入widget 集合 组件集合
      ),
    );
  }
}

class demossds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("sdsd" * 20), //报错 因为超出屏幕
      ],
    );
  }
}

//流式布局
class Wrapdemo extends StatefulWidget {
  @override
  _WrapdemoState createState() => _WrapdemoState();
}

class _WrapdemoState extends State<Wrapdemo> {
  List<int> list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 20; i++) {
      list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      //
      alignment: WrapAlignment.end,
      //aligenment 排放
      spacing: 1.0,
      //间隔
      runSpacing: 1.0,
      //纵轴间隔
      children: list //children 要的是集合[] map返回的是列表（）
          .map((e) => Container(
                height: 100,
                width: 100,
                child: Text(e.toString()),
                color: Colors.blue,
              ))
          .toList(),
    );
  }
}

//叠层布局 第二层覆盖第一层 从x y 坐标开始绘画
class stackdemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // color: Colors.cyanAccent,
      // width: double.infinity, //最大
      //当 设置里 定位 positioned Alignment 无效
      alignment: AlignmentDirectional.centerEnd //align 排序
      ,
      children: [
        Container(
          color: Colors.deepOrange,
          width: 100,
          height: 100,
        ),
        Container(
          color: Colors.teal,
          width: 100,
          height: 100,
        ),
        Positioned( //定位
          // width: 200, 左右不能设置
          // height: 200, 上下不能设置  因为已经做了位移
          child: Container(
            color: Colors.cyan,
            // width: 400, //无效 从Positioned 获值
            // height: 400, //无效

          ),
          top: 10,
          left: 10,
          right: 10,
          bottom: 20, //大小跟 父容器（子Container） 的值走
        ),
      ],
    );
  }
}

class Aligndemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.white54,
      child: Align(
        alignment: Alignment(1,1),//取值在 0和1 之前
     child: FlutterLogo(
       size: 30,
     ),
      ),
    );
  }
}

class Edgedemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20000,
      height: 20000,
      color:Colors.purpleAccent ,
      // margin:EdgeInsets.all(8) ,//外边距 插入
      margin: EdgeInsets.only(left: 10),//only 只
      padding:EdgeInsets.all(10) ,//内边距
      child: Text(context.toString()),
    );
  }
}
