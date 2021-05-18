import 'package:flutter/cupertino.dart';
import 'package:flutter_yuan/mvvmDemo_View/menu.dart';
import 'package:flutter_yuan/mvvmDemo_View/registerView.dart';
import 'package:flutter_yuan/mvvmDemo_View/view.dart';
//路由封装
Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => login(),
  "menu":(BuildContext context) =>menuView(),
  "register":(BuildContext context)=>RegisterView(),
};