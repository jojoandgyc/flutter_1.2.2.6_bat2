import 'package:flutter/material.dart';

class ListviewDemostate extends StatefulWidget {
  const ListviewDemostate({Key key}) : super(key: key);

  @override
  _ListviewDemostateState createState() => _ListviewDemostateState();
}

class _ListviewDemostateState extends State<ListviewDemostate> {
  bool show = false;
  List<int> list = [];
  ScrollController _context; //Scroll 滚动

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 100; i++) {
      list.add(i);
    }
    _context = ScrollController();
    _context.addListener(() {
      print(_context);
      if (_context.offset >= 30 && show == false) {
        setState(() {
          show = true;
        });
      } else if (_context.offset < 30 && show == true) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _context.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动列表"),
      ),
      floatingActionButton: show
          ? FloatingActionButton(
              child: Icon(Icons.expand),
              onPressed: () {
                _context.animateTo(0,//animate 动画
                    duration: Duration(milliseconds: 400), curve: Curves.bounceOut);
              },
            )
          : null,
      body: ListView.builder(//滚动方向
        scrollDirection: Axis.horizontal,//两个参数是 子列表的 上下文 和个数
        itemBuilder: (BuildContext buildContext, int intdex) {
          if (2 == intdex) {
            return Icon(Icons.ac_unit_rounded);
          }
          return Text(list[intdex].toString());
        },
        itemCount: list.length,
        controller: _context,
      )
      /*Scrollbar(
        //显示滚轮
        child: RefreshIndicator(
          //RefreshIndicator 刷新指示器
          child: ListView(
            itemExtent: 50, //子高度 extent程度
            // reverse: true, //反向
            shrinkWrap: true, //子组件高多少 列表多高
            children: list.map((e) => Text(e.toString())).toList(),
          ),
          onRefresh: _onRefresh,
        ),
        */ /* ListView(
          itemExtent: 50,//子高度 extent程度
          reverse: true,//反向
          shrinkWrap: true,//子组件高多少 列表多高
          children: list.map((e) => Text(e.toString())).toList(),
        ),*/ /*
      )*/
      , //滚动的
    );
  }

  //未来/发生了 Refresh 刷新
  Future _onRefresh() async {
    await Future.delayed(
      Duration(seconds: 3), //Duration 持续时间 seconds 秒
    );
    return "结束";
  }
}
