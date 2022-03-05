import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class WalletContoroler extends GetxController{

  String mony='';

  Future<String> getpoldata() async {

    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";
    var url ='https://noyaft.com/customer/api/customers2';
    final response = await http.get(Uri.parse(url),headers:edit,
    );
    print(json.decode(response.statusCode.toString()));
    print (json.decode(response.body));
    json.decode(response.body)['data']['items'].forEach((item){
      if(item['wallet']==null){
        mony='0';
      }else
      mony=item['wallet'].toString();
    });

    return "hi";
  }




}