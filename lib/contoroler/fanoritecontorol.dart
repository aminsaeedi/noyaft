import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import '../main.dart';



class FavoritaContoroler extends GetxController{

 List userfavorite=[];


  Future<String> getfavorites() async {
    String url = 'https://noyaft.com/customer/api/favorites';
    var edi= <String, String>{};
    edi['Authorization']='Bearer $token';
    edi['Accept']="application/json";

    final response = await http.get(Uri.parse(url),headers: edi);

    print(json.decode(response.statusCode.toString()));
    print(json.decode(response.body));
userfavorite=json.decode(response.body)['data']['items'];

return "hi";
  }

}

