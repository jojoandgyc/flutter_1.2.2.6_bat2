import 'package:flutter/material.dart';
AppBar getAPPbar(String name){
  return AppBar(

    title: Text(name),
    elevation: 10,//阴影
    centerTitle: true,

  );


}