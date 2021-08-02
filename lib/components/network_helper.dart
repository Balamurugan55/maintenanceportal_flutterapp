import 'dart:convert';
//pGd@s*CeN4bJ
import 'package:http/http.dart' as http;

const url = 'http://192.168.221.163:3000/mainporauth/';
final rurl = Uri.parse(url);

class NetworkHelper {
  static getAuth(body) async {
    print(body);
    var res = await http.post(rurl, body: body);
    return jsonDecode(res.body);
    //var res = await http.get(rurl);
  }

  static getWolist(body) async {
    print(body);
    var res = await http.post(Uri.parse(url + 'mainwoget/'), body: body);
    print(res);
    return jsonDecode(res.body);
  }
}
