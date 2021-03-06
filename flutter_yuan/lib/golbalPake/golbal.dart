import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weui/toast/index.dart';

class Golbal {
  static Golbal _instance;
  Dio dio;
  String token;
  Map user;
  BuildContext context;
  var loading;

  static Golbal getInstance() {
    if (_instance == null) {
      //为空 创建一个Golbal
      _instance = new Golbal(); //这里的Golbal 是无参数构造
      return _instance;
    }
  }

  Golbal() {
    //无参构造
    dio = new Dio(); //对Dio 进行初始化
    dio.options = BaseOptions(
      //OPtions 选择
      //base 基本选项
      baseUrl: "http://42.193.118.40:3000",
      // 这里的/不用加 使用的时候加
      connectTimeout: 5000,
      //connect 连接 超时
      sendTimeout: 5000,
      receiveTimeout: 5000,
//                 以application/x-www-form-urlencoded格式编码
      contentType: Headers.formUrlEncodedContentType,
      // response 返回   json
      responseType: ResponseType.json,
      //receive 接收 超时
      headers: {
        "token": "321213123",
        "code": "string",
        "data": {},
        "msg": "string"
      },
      //Headers 头  Encoded 编码
      /*contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json, //Response 反应*/
    ); //Wrapper 包装纸  Interceptors 拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options) {
        loading = WeToast.loading(context)(message: "Loading...");
      },
      onResponse: (e) {
        loading();
      },
      onError: (e) {
        loading();
        String msg = "";
        if (e.type == DioErrorType.CONNECT_TIMEOUT) {
          msg = "连接超时错误";
        } else {
          msg = "接口错误！";
        }
        WeToast.fail(context)(message: msg);
      },
    ));
    /*dio.interceptors.add(//onRequest 查询
      InterceptorsWrapper(onRequest: (options) {
        //Request 请求
        print("请求" + options.headers.toString());
        print("请求" + options.extra.toString()); //extra 附带的
      }, onResponse: (e) {
        //Respons 返回 发送时候拦截 接收时候拦截
        print("返回" + e.toString());
      }, //Response 反应 报错时候拦截
          onError: (e) {
        if (e.type == DioErrorType.CONNECT_TIMEOUT) {
          print("错误" + e.toString());
        } else {
          print("Connect超时错误");
        }
      }),
    );*/
  }
}
