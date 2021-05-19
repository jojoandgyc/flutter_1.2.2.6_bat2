import 'package:flutter/material.dart';

//点击==>
class clickdemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 动作 检测器
      onTap: () {
        print("单机");
      }, //单机
      onDoubleTap: () {
        print("双击");
      }, //双击
      child: Text("点击文本"),
    );
  }
}

//输入框==>
class inputDemo extends StatefulWidget {
  @override
  _inputDemoState createState() => _inputDemoState();
}

class _inputDemoState extends State<inputDemo> {
  TextEditingController _use = TextEditingController(); //文本 编辑控 制器
  TextEditingController _password = TextEditingController(); //文本 编辑控 制器
  GlobalKey _key = GlobalKey<FormState>(); //Globalkey 全局 键  formstate表单状态

  FocusNode _u = FocusNode();
  FocusNode _p = FocusNode();
//Scope 范围
  FocusScopeNode _focusScopeNode;
  @override
  void initState() {
    //进入执行的
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    //退出执行的 dispose 丢弃/处理
    // TODO: implement dispose
    _password.dispose();
    _use.dispose();
    _u.dispose();
    _p.dispose();
    if(_focusScopeNode!=null)_focusScopeNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      autovalidate: true, //自动校验 aoto 自动 validate 校验
      child: Column(
        children: [
          TextFormField(
            focusNode: _u,
            autofocus: true,
            //自动获取焦点 focus焦点
            //文本表单域
            decoration: InputDecoration(
              icon: Icon(Icons.add), //没下划线
              prefixIcon: Icon(Icons.add) //有下划线 prefix 前缀 pre在..之前
              ,
              labelText: "提示文本", //label 标签
              hintText: "账号",
            ),
            validator: (v) {
              if (v == null) {
                return "输入不能为空";
              }
            },
            onFieldSubmitted: (v)
            {
              print(v);
            },
            textInputAction: TextInputAction.next,
            controller: _use, //controller 控制器
          ),

          SizedBox(
            height: 99,
          ),
          TextFormField(//
            focusNode: _p,
            onChanged: (v) {
              print(v); //值没次变化都会输出
            },
            //Deciration 装饰
            decoration: InputDecoration(
              icon: Icon(Icons.add), //没下划线
              prefixIcon: Icon(Icons.add), //有下划线 prefix 前缀 pre在..之前
              labelText: "提示文本", //label 标签
              hintText: "密码", //hint 暗示
            ),
            validator: (v) {
              //validator 验证器
              if (v == null || v.length < 5) {
                return "输入不能为空且大于五";
              }
            },
            //文本输入按钮 textInputAction  在输入键盘里显示
            textInputAction: TextInputAction.send,
            //search 搜索
            obscureText: true,
            //obscure 模糊 隐藏输入值
            onFieldSubmitted: (v) {
              print("objt");
            },
            controller: _password, //controller 控制器
          ), //Field 范围 文本字段
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () //Raised 升起按钮 Pressed 按下
                {
                  if(_focusScopeNode==null)
                  {
                      _focusScopeNode=FocusScope.of(context);//上下文 context
                  }
             _focusScopeNode.requestFocus(_u);//跳转到 这个焦点
                  _focusScopeNode.unfocus();//取消所有焦点
              //current当前State     Form 表单
              print((_key.currentState as FormState).validate().toString());
            },

            child: Text("提交"),
          )
        ],
      ),
    );
  }
}
