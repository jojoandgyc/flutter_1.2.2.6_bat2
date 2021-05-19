import 'package:flutter/material.dart';

class crad_demo extends StatefulWidget {
  const crad_demo({Key key}) : super(key: key);

  @override
  _crad_demoState createState() => _crad_demoState();
}

class _crad_demoState extends State<crad_demo> {
  List<Map> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 10; i++) {
      list.add({
        "age": 10 + i,
        "name": "山哥" + i.toString(),
      });
    }
  }

  Widget _itemwidget(BuildContext context, int index) {
    return Card(
      shadowColor: Colors.tealAccent, //阴影颜色
      color: Colors.lightBlueAccent,
      elevation: 9, //阴影大小
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ), //list 行里的 name
          Text(list[index]["name"].toString()),
          SizedBox(
            height: 8,
          ),
          Text(list[index]["age"].toString()),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("卡片"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),//创建一个 静态方法
        // 传进来的是上下文 和 计数器 用来迭代创建 Card 被调用一次创建 一个Card
        // 一个Card 里有 一个 Column布局 往上看 _itemwidget  list 里面有10个 词条
        child:ListView(
          children: [
            ListTile(//列表文件
              leading: Icon(Icons.add),//leading 首部
              tileColor: Colors.teal,
              title: Text("标题"),
              subtitle: Text("我是副标题subTitle"),//副标题
              trailing:Icon(Icons.list) ,//trailing 尾部
            ),
          ],
        )
        //ListView.builder(itemBuilder: _itemwidget,itemCount: list.length,)
        /*ListView(
          children: [
            Card(
              child: Container(
                width: double.infinity,
                height: 200,
              ),
            )
          ],
        )*/,
      ),
    );
  }
}
