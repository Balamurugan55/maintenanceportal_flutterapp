import 'dart:convert';
//pGd@s*CeN4bJ
import 'package:http/http.dart' as http;

const url = 'http://192.168.43.122:3000/mainporauth/';
final rurl = Uri.parse(url);

const url1 = url + 'mainnotcr';
final rurl1 = Uri.parse(url1);

const url2 = url + 'mainnotget';
final rurl2 = Uri.parse(url2);

const url3 = url + 'mainnotdet';
final rurl3 = Uri.parse(url3);

const url4 = url + 'mainnotup';
final rurl4 = Uri.parse(url4);

const url5 = url + 'mainwocr';
final rurl5 = Uri.parse(url5);

const url6 = url + 'mainwoget';
final rurl6 = Uri.parse(url6);

const url7 = url + 'mainwodet';
final rurl7 = Uri.parse(url7);

const url8 = url + 'mainwoup';
final rurl8 = Uri.parse(url8);

class NetworkHelper {
  static getAuth(body) async {
    print(body);
    var res = await http.post(rurl, body: body);
    print(res.body);
    return jsonDecode(res.body);
    //var res = await http.get(rurl);
  }

  static getNocr(body) async {
    print(body);
    var res = await http.post(rurl1, body: body);
    print(res.body);
    return jsonDecode(res.body);
  }

  static getNoget(body) async {
    print(body);
    var res = await http.post(rurl2, body: body);
    print(res.body);
    return jsonDecode(res.body);
  }

  static getNodet(body) async {
    print(body);
    var res = await http.post(rurl3, body: body);
    print(res.body);
    return jsonDecode(res.body);
  }

  static getNoup(body) async {
    print(body);
    var res = await http.post(rurl4, body: body);
    print(res);
    return jsonDecode(res.body);
  }

  static getWocr(body) async {
    print(body);
    var res = await http.post(rurl5, body: body);
    print(res.body);
    return jsonDecode(res.body);
  }

  static getWoget(body) async {
    print(body);
    var res = await http.post(rurl6, body: body);
    print(res.body);
    return jsonDecode(res.body);
  }

  static getWodet(body) async {
    print(body);
    var res = await http.post(rurl7, body: body);
    print(res.body);
    return jsonDecode(res.body);
  }

  static getWoup(body) async {
    print(body);
    var res = await http.post(rurl8, body: body);
    print(res);
    return jsonDecode(res.body);
  }
}
