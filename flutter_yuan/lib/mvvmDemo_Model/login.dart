import 'package:flutter_yuan/golbalPake/golbal.dart';
import 'package:flutter_yuan/utils_rsa/tuils.dart';

Future loginModel(String user,String pass)async{
  //加密 密码
  String pwd= await encodeString(pass);
  // 验证 用户密码    getInstance 创建一个Gobal   post返回是否成功
  return await Golbal.getInstance().dio.post("xxxxxx/xxxxx/xxxxx",
  queryParameters: {
    "密码":pass,
    "用户":user,
  }
  );
}