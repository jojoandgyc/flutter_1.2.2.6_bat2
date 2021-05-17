import 'dart:convert';
import 'package:encrypt/encrypt.dart';

import 'package:flutter_yuan/utils_rsa/data.dart';

/*
 通过秘钥加密
 传入   Content = 加密前的文本     用公钥加密完返回
* */


Future<String> encodeString(String content) async {
  var publicKey = RSAKeyParser().parse(pubKey); //parse 解析 生成公钥
  //encrypter 加密的 encryoted 加密  ancrypter 传的是公钥
  final encrypter = Encrypter(RSA(publicKey: publicKey));

  List<int> sourceBytes = utf8.encode(content);
  int inputLen = sourceBytes.length;
  int maxLen = 117;
  List<int> totalBytes = List();
  for (var i = 0; i < inputLen; i += maxLen) {
    int endLen = inputLen - i;
    List<int> item;
    if (endLen > maxLen) {
      item = sourceBytes.sublist(i, i + maxLen);
    } else {
      item = sourceBytes.sublist(i, i + endLen);
    } //encrypter 加密的
    totalBytes.addAll(encrypter.encryptBytes(item).bytes);
  }//encode 把…译成密码  total 总字数
  return base64.encode(totalBytes);

  /*final publicKey = await parseKeyFromFile<RSAPublicKey>('gong.pem');
  final privKey = await parseKeyFromFile<RSAPrivateKey>('si.pem');

  final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
  final encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privKey));

  final encrypted = encrypter.encrypt(plainText);
  final decrypted = encrypter.decrypt(encrypted);
  print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  print(encrypted.base64);
  print("在RAS里面输出");*/
}
