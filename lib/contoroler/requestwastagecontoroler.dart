import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../main.dart';



class RequestWastageContoroler extends GetxController{


List garbagetaype=[];

 late String weight;
 late  String decrtion;








  Future getcouriers() async {

    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";
    var url ='https://noyaft.com/courier/api/couriers';
    final response = await http.get(Uri.parse(url),headers:edit,
    );
    print(json.decode(response.statusCode.toString()));
    log (json.decode(response.body).toString());

  }
Future gettyeps()async{
  var edit= <String, String>{};
  edit['Authorization']='Bearer $token';
  edit['Accept']="application/json";
  var url ='https://noyaft.com/garbage/api/types';
  final response = await http.get(Uri.parse(url),headers:edit,
  );

 Map javab=json.decode(response.body);
  print(json.decode(response.statusCode.toString()));

   log (json.decode(response.body).toString());

garbagetaype=javab["data"]["items"];

}



}