import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import '../main.dart';


class singelContoroler extends GetxController{
  late String allcomment;
  late String img;
  List ax=[];
  late String price;
  late int star;
  late String name;
  late Map description;
late String Inventory;




  int faid=0;
  Future<String> getsingeledata (
      int pid
      )async{

    try {
      var response = await Dio().get('http://noyaft.com/product/api/full?id=$pid',);
      Map<String, dynamic> res;
      res = json.decode(response.toString());
      // print(response.statusCode);
      // print(res);
      res["product"].forEach((item){
        img= item["img"];
      });
      res["product_attachments"].forEach((item){
        ax.add(item["img"]);
      });
      res["product"].forEach((item){
        if(item["comment"]['rate']==''){
          star=0;
        }else{
          star= item["comment"]['rate'];}
        allcomment=item["comment"]['all_comment'].toString() ;
      });
      res["product"].forEach((item){
        name= item["name"]['fa'];
      });

      res["product"].forEach((item){

        price= item["price"].toString();
      });
      Inventory=res["inventory"][0]["num"].toString();
    
      res["product"].forEach((item){
        description= item["description"];
      });

    } catch (e) {
      print(e);
    }













   String url = 'https://noyaft.com/customer/api/favorites';
    var edi= <String, String>{};
    edi['Authorization']='Bearer $token';
    edi['Accept']="application/json";

    final response = await http.get(Uri.parse(url),headers: edi);

    print(json.decode(response.statusCode.toString()));
    // print(json.decode(response.body));
    json.decode(response.body)['data']['items'].forEach((item){
      if(pid==item['product_id']
){

faid=item['id'];
      }
    });





return "hi";



  }



 Future sendfavorite(
   int pid,
   int cid
 ) async {
    var map = <String, dynamic>{};
    map['product_id']= pid.toString();
    map['category_id'] =  cid.toString();
    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";
    var url ='https://noyaft.com/customer/api/favorites';
    final response = await http.post(Uri.parse(url),headers:edit,body: map,
    );
    print(json.decode(response.statusCode.toString()));
    print(json.decode(response.body));

   Get.snackbar('محصول به علاقه مندی ها اضافه شد', "",
     backgroundColor: Colors.grey.withOpacity(.5),
     snackPosition: SnackPosition.BOTTOM ,);
  }

  Future  deletfavorite(int pid,
   int cid) async {
    var map = <String, dynamic>{};
    map['product_id']= pid.toString();
    map['category_id'] =   cid.toString();
    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";
    var url ='https://noyaft.com/customer/api/favorites/$faid';
    final response = await http.delete(Uri.parse(url),headers:edit,body: map,
    );
    print('8****8');
    print(json.decode(response.statusCode.toString()));
    print(json.decode(response.body));
  Get.snackbar('محصول از علاقه مندی ها حذف شد', "",
     backgroundColor: Colors.grey.withOpacity(.5),
     snackPosition: SnackPosition.BOTTOM ,);
    
  }

}