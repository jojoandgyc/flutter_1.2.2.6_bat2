import 'package:flutter/material.dart';

class Tabledemo extends StatefulWidget {
  const Tabledemo({Key key}) : super(key: key);

  @override
  _TabledemoState createState() => _TabledemoState();
}

class _TabledemoState extends State<Tabledemo> {
  List<Map> TableList = [];
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 10; i++) {
      print(i);
      TableList.add({
        "name": "s" * i,
        "gender": i % 2 == 0 ? "男" : "女",
        "select": false,
        "age": i,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表格"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: DataTable(
          onSelectAll: (v) {
            for (var i = 0; i < TableList.length; i++) {
              setState(() {
                //这里 的操作可以 自动刷新页面
                if (TableList[i]["select"] != v) {
                  TableList[i]["select"] = v;
                }
              });
            }
          },
          //里面的e 是列表的Key
          rows: TableList.map((e) => DataRow(
                  selected: e["select"],
                  onSelectChanged: (v) {
                    //多选框点击 变化事件
                    setState(() {
                      //变化了就 重赋值 给select
                      if (e["select"] != v) {
                        e["select"] = v;
                      }
                    });
                  },
                  cells: [
                    DataCell(Text(e["name"])),
                    DataCell(Text(e["age"].toString())),
                    DataCell(Text(e["gender"])),
                  ])).toList(),
          sortColumnIndex: _sortColumnIndex,
          //sort Column Index 排列 序列 索引
          sortAscending: _sortAscending,
          //sort 排列 Ascending 向上
          columns: [
            DataColumn(
                label: Text("姓名"), //on Sort 传回来两个值 要有形参接收
                onSort: (columnIndex, Ascending) {
                  setState(() {
                    _sortAscending = Ascending;
                    _sortColumnIndex = columnIndex;
                    TableList.sort((a, b) {
                      //形参是 两个列表
                      if (!Ascending) {
                        //发送点击 值变了
                        var c = a;
                        a = b;
                        b = c;
                      }
                      return a["name"]
                          .toString()
                          .length //compareTO 比较
                          .compareTo(b["name"].toString().length);
                    });
                  });
                }),
            DataColumn(
                label: Text("年龄"),
                onSort: (columnIndex, Ascending) {
                  setState(() {
                    _sortAscending = Ascending;
                    _sortColumnIndex = columnIndex;
                    TableList.sort((a, b) {
                      //形参是 两个列表
                      if (!Ascending) {
                        //发送点击 值变了
                        var c = a;
                        a = b;
                        b = c;
                      }
                      return a["age"]>b["age"]?a["age"]:b["age"];

                      //compareTO 比较
                    });
                  });
                }),
            DataColumn(label: Text("性别")),
          ],
        ),

//重写....................................................................................

        /*DataTable(
            //写在 columns 里 排序
            columns: [
              //column 竖列 两列
              //升序 Ascending
              DataColumn(label: Text("姓名")),//开头名字
              DataColumn(label: Text("性别")),
              DataColumn(label: Text("年龄")),
            ],
            sortAscending: _sortAscending, //升序
            sortColumnIndex: _sortColumnIndex, //column 竖计数器
            rows: TableList.map(
              (e) => DataRow(
                  //这里错了 要写在child 里
                  selected: e["select"], //Row 行 select 选择 传一个Bool
                  onSelectChanged: (v) {//v是二值量 返回是否选勾选 多选框设置
                    setState(() {
                      if (e["select"] != v) {
                        e["select"] = v;
                      }
                    });
                    */ /* for (var i; i < TableList.length; i++) {
                    setState(() {错误
                      if (e["select"] != v) {
                        e[i]["select"] = v;
                      }
                    });
                  }
*/ /*
                  }
                  //有全选 这个功能 自己实现的话 上看 性能高一些
*/ /*                        (v) { //set 状态才能 刷新 页面状态
                      setState(() { //v是 行选择状态返回值
                        if (e["select"] != v) {
                          e["select"] = v;
                        };
                      });
                    }*/ /*
                  ,
                  cells: [
                    //cell s
                    DataCell(Text(e["name"])), //DataCell 数据单元 cell 细胞
                    DataCell(Text(e["gender"])), //gender 性别
                    DataCell(Text(e["age"].toString())), //年龄
                  ]),
            ))*/

        //Column s 列表
      ) /*Table(//
          border: TableBorder.all(
            color: Colors.teal,

          ),
          children: TableList.map((e) =>// ROW列
          TableRow(children: [Text(e["name"]),
            Text(e["gender"]),
          ],)).toList(),
        )*/
      ,
    );
  }
}
