import 'package:flutter/material.dart';

import 'golbalPake/golbal.dart';

void main() {
  runApp(
      /* //全局变量
  MultiProvider(
    providers: [
      //存放多个 全局变量
      ChangeNotifierProvider(
        create: (context) => CountProvider(),
      ),
      ChangeNotifierProvider(create: (context)=>MvvmDemoViewModel()),

      //以下是 重复
ChangeNotifierProvider(
          create: (context) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CountProvider(),
        ),

    ],
    child: MyApp(),
  ),*/
      MyApp());
}

/* //项目路由页面
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  //routes: routes ;//这里的routes是一个Map集合
      routes: {
        "/": (context) => Edgedemo(),
        "cod": (context) => ListviewDemostate(),
        "底部选卡": (context) => bottomNavgaotBarDemoState(),
        "网格布局": (context) => gridview_demo(),
        "弹窗": (context) => alertdialog_demo2(),
        "表格": (context) => Tabledemo(),
        "卡片": (context) => crad_demo(),
        "优化": (context) => oupimize_demo(),
        "调试": (context) => debug_demo(),
        "全局管理": (context) => provider_demo(),
        "全局管理2": (context) => provider_demoTow(),
        "dio网络请求": (context) => Dio_demo(),
        "Mvvm架构": (context) => DemoView(),
        "layot": (context) => widget_demo(),
        "widget": (context) => DecorateBoxdemo(),
        "page_demo": (context) => page_demo(),
        "底部选卡": (context) => bottomNavgaotBarDemoState(),
      },如果这里注册了 路由 就不会到这个监听里面 Generate 生产 监控未注册 的路由 报错
      onGenerateRoute: (s) {
        print(s.name); //到监听里 会报错 除非有 switch进行返回
        switch (s.arguments) //arguments 复数、自变量
            {
          //case 实列 switch 岔道
          case "sdd":
            //返回一个新建的材料包路由
            return MaterialPageRoute(
                builder: (context) {
                  return intercept();
                },
                settings: s);
            break;
          default:
            ;
        }
      },
      debugShowCheckedModeBanner: false,
      title: ' Flutter 1.2.2.6 bat2 ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter 1.2.2.6 bat2 '),
    );
  }
}
*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
//用于 Dio 测试
  void loadData() async {
    //instance 列子
    await Golbal.getInstance().dio.get("/student/allstudent", queryParameters: {
      "id": "sdsadas",
    });
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
