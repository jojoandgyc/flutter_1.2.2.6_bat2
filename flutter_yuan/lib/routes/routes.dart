import 'package:flutter/cupertino.dart';
import 'package:flutter_yuan/mvvmDemo_View/view.dart';
//路由封装
Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => login(key: Key("登录Key"),),
};