import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yuan/utils_rsa/tuils.dart';

class login extends StatefulWidget {
  const login({ Key key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("輸出");
    print(encodeString("123456"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("登录页面"),
          /*          bottom: RaisedButton

*/
          ),
      body: Denglu(),
        );
  }


}

class Denglu extends StatelessWidget {
  const Denglu({ Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text("登录"),
        textColor: Colors.amber,
        onPressed: () {
          print(encodeString("123456"));
        });
  }
}

