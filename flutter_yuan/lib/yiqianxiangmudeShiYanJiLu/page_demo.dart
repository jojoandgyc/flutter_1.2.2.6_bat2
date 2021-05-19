import 'package:flutter/material.dart';

class page_demo extends StatefulWidget {
//装置 集合
  List<Widget> widgets = [FreeRTOS(), Android(), IOS()];

  @override
  _page_demoState createState() => _page_demoState();
}

class _page_demoState extends State<page_demo>
    with SingleTickerProviderStateMixin {
  // with 和 SingleTickerProviderStateMixin混入
  List tabe = ["IOS", "FreeROST", "Android"];
  int _index = 0;

  TabController _controller; //控制器

  @override
  void initState() {
    // TODO: implement initState
    //传入 滑动页
    _controller = new TabController(
      initialIndex: _index,
      length: tabe.length,
      vsync: this,
    ); //同步
    _controller.addListener(() {
      //发生变化的时候 产生的监听
      setState(() {
        //页面里的 全局变量
        _index = _controller.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //标题居中
        title: Text("Scaffold测试"),
        /*leading: IconButton(
          //左侧按钮 只能一个
          //leading 引导    导航栏返回 按钮
          icon: Icon(Icons.home),
          onPressed: () {
            print("输出");
          },
        ),*/
        //行为
        actions: [
          //这是 右侧按钮 可以放多个
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print("傻逼");
              }),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print("傻逼");
              }),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print("傻逼");
              })
        ],
        elevation: 10,
        //阴影
        //高度
        bottom: TabBar(
          controller: _controller,
          tabs: tabe
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
      ),
      drawer: Mydrawer(), //侧拉层 和 Bar里的leading（主导） 冲突
      //使用 自定义装置 列表里的装置
      body: TabBarView(
        //TabBarView 才能滑动
        children: widget.widgets,
        controller: _controller,
      ) /*Text(_index.toString())*/,
    );
  }
}

class FreeRTOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("FreeRTOS"),
    );
  }
}

class Android extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Android"),
    );
  }
}

class IOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("IOS"),
    );
  }
}
//侧拉栏
class Mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //侧拉栏 MediaQuery 媒体查询
      child: MediaQuery.removePadding(
          context: context,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text("第一栏"),
              ),
            ],
          )),
    );
  }
}

