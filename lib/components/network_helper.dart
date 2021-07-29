import 'dart:convert';
//pGd@s*CeN4bJ
import 'package:http/http.dart' as http;

const url = 'http://192.168.229.163:3000/mainporauth/';
final rurl = Uri.parse(url);

class NetworkHelper {
  static getAuth(body) async {
    print(body);
    var res = await http.post(rurl, body: body);
    return jsonDecode(res.body);
    //var res = await http.get(rurl);
  }
}
