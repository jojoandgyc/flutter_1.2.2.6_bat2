import 'package:flutter/material.dart';

class gridview_demo extends StatefulWidget {
  const gridview_demo({Key key}) : super(key: key);

  @override
  _gridview_demoState createState() => _gridview_demoState();
}

class _gridview_demoState extends State<gridview_demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网格布局"),
      ),

      body: GridView(
        scrollDirection: Axis.horizontal ,//scroll 滚轴
        //grid 网格Delegate 代表      crossAxis 横轴 个6
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //横轴 cross Count个数
      //报错不知道为什么    mainAxisExtent: 10, //Axis 轴 Extent程度
          crossAxisSpacing: 10, //Spacing 间距
          mainAxisSpacing: 10,
        ),

        children: [
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.lime,
          ),
          Container(
            color: Colors.lightGreen,
          ),
          Container(
            color: Colors.lightBlueAccent,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.tealAccent,
          ),
          Container(
            color: Colors.tealAccent,
          ),
          /*Icon(Icons.ac_unit),
          Icon(Icons.ac_unit),
          Icon(Icons.ac_unit),
          Icon(Icons.ac_unit),
          Icon(Icons.ac_unit),
          Icon(Icons.ac_unit),
          Icon(Icons.account_box_outlined),
          Icon(Icons.account_box_outlined),
          Icon(Icons.account_box_outlined),
          Icon(Icons.account_box_outlined),
          Icon(Icons.account_box_outlined),
          Icon(Icons.account_box_outlined),*/
        ],
      ),
    );
  }
}

