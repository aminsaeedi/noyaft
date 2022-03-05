
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class PersonalContoroler extends GetxController{

  RxString ta='lale'.obs;
  RxInt mame=0.obs;

  RxString name ='وارد نشده'.obs;
  RxString familyname ='وارد نشده'.obs;
  RxString national_code ='وارد نشده'.obs;
  RxString card_number ='وارد نشده'.obs;
  RxString birth_date ='وارد نشده'.obs;
  RxString store_name ='وارد نشده'.obs;
  RxString mobile ='وارد نشده'.obs;

  pla(){
    mame++;
  }
  Future<String>  getuserdata() async {

    try {
      var edit= <String, String>{};
      edit['Authorization']='Bearer $token';
      edit['Accept']="application/json";



      var response = await Dio().get(
        'https://noyaft.com/customer/api/customers2',
        options: Options(
          headers: edit,
        ),
      );
      Map<String, dynamic> res;
      res = json.decode(response.toString());
      print(response.statusCode);
      print(res);


      // if(res['data']['items'][0]['name']['fa'] != null){
        String f =res['data']['items'][0]['name'];
        name=f.obs;

      // }else{print("Ssss");}

      // print(name);
      // if(res['data']['items'][0]['family']['fa']!=null){
        String n =res['data']['items'][0]['family'];
        familyname =n.obs;
      // }

      // if(res['data']['items'][0]['national_code'] != null){
        String na=res['data']['items'][0]['national_code'];
        national_code=na.obs;
      // }

      String mo=res['data']['items'][0]['mobile'];
      mobile=mo.obs;

      // if(res['data']['items'][0]['card_number']!=null){
        String c =res['data']['items'][0]['card_number'].toString();
        if(c!="null"){
        card_number =c.obs;
      }else{
          card_number="وارد نشده" .obs;
        }

      String s =res['data']['items'][0]['store_name'];
      store_name =s.obs;
      // if(res['data']['items'][0]['birth_date']!=null){
        String b =res['data']['items'][0]['birth_date'];
        birth_date =b.obs;


      // }

      return 'hi';

    } catch (e) {
      return 'hi';

    }
  }



  changepersonaldata(
      String n,
      String f,
      String c,
      String b,
      String s,

      )  async {

    name=n.obs;

    familyname=f.obs;

    store_name=c.obs;

    birth_date=b.obs;
    national_code=s.obs;

    Get.defaultDialog(
      barrierDismissible: false,
      onWillPop: ()async{
        return false;
      },
      title: 'لطفا صبر کنید',
      content: const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.amber,
          valueColor:  AlwaysStoppedAnimation<Color>(Colors.red),

        ),
      ),

    );


    var map = <String, dynamic>{};
    map['store_name'] =  c;
    map['name'] =  n;
    map['family'] =  f;
    map['national_code'] = s;
    map['birth_date'] = b;
    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";
    Map<String, dynamic> javab;
    try {
      var response = await Dio().put('https://noyaft.com/customer/api/update_cus',
        data:map,
        options: Options(
          headers: edit,
        ),
      );

      javab = json.decode(response.toString());
      print(response.statusCode);
      print(response);
      if(response.statusCode==200){
        if(javab["success"]==true)
          Get.back();
        Get.back();
      }


    } catch (e) {
      print(e);
    }






  }



  changecardnumber(

      String c,


      )  async {


    card_number=c.obs;



    Get.defaultDialog(
      barrierDismissible: false,
      onWillPop: ()async{
        return false;
      },
      title: 'لطفا صبر کنید',
      content: const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.amber,
          valueColor:  AlwaysStoppedAnimation<Color>(Colors.red),

        ),
      ),

    );


    var map = <String, dynamic>{};
    map['card_number'] =  c;

    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";
    Map<String, dynamic> javab;
    try {
      var response = await Dio().put('https://noyaft.com/customer/api/update_cus',
        data:map,
        options: Options(
          headers: edit,
        ),
      );

      javab = json.decode(response.toString());
      print(response.statusCode);
      print(response);
      if(response.statusCode==200){
        if(javab["success"]==true)
          Get.back();
        Get.back();
      }


    } catch (e) {
      print(e);
    }






  }


}