
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noyaft/screen/firstseen.dart';
import 'package:noyaft/screen/singorlog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../main.dart';


class SingupContoroler extends GetxController{
 late bool exists;
 String time="1";
  TextEditingController phone=TextEditingController();
  TextEditingController code=TextEditingController();





  getpcode()async{
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
    map['accounttype_id'] = '2';
    map['mobile'] = phone.text;
    map['request_type'] = '';
    map['type'] = 'mobile';
    Map<String, dynamic> javab;
    try {
      var response = await Dio().post('https://noyaft.com/userverification/api/send',data:map,);
      javab = json.decode(response.toString());
      print(response.statusCode);
      log(response.toString());
      exists=javab["exists"];

    Get.back();
          Get.to(Codetrue());

    } catch (e) {
      Get.defaultDialog(
          barrierDismissible: false,

          title: "دوباره امتحان کنید",
          actions:[ ElevatedButton(onPressed: (){   Get.back();}, child: Text("خروج"))]

      );
      print(e);
    }


  }

























  getsing()async{
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

if(exists) {
  var map = <String, dynamic>{};
  map['otp'] = code.text;
  map['email'] = '';
  map['mobile'] = phone.text;
  map['pass'] = '';
  Map<String, dynamic> javab;
  try {
    var response = await Dio().post(
      'https://noyaft.com/customer/api/login/with/otp', data: map,);

    javab = json.decode(response.toString());
    print(response.statusCode);
    log(response.toString());
    if (javab['ok'] == false) {
      Get.back();
      Get.defaultDialog(
          barrierDismissible: false,
          onWillPop: () async {
            return false;
          },
          title: javab['message'].toString(),
          content: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.amber,
              onPrimary: Colors.white,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              side: const BorderSide(color: Colors.black12, width: .5),
            ),

            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'برگشت', style: TextStyle(fontSize: 12, color: Colors.black
                  , fontWeight: FontWeight.bold
              ),),
            ),
            onPressed: () {
              Get.back();
            },
          )

      );
    }
    if (javab['ok'] == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', javab['accessToken']);
      token = javab['accessToken'];
      Get.back();
      Get.offAll(FirstSeen());

    }
  } catch (e) {
    print(e);
  }
}
if(exists==false){
  var map = <String, dynamic>{};
  map['otp'] = code.text;
  map['email'] = '';
  map['mobile'] = phone.text;
  map['pass'] = '';
  Map<String, dynamic> javab;
  try {
    var response = await Dio().post(
      'https://noyaft.com/customer/api/signup/with/otp', data: map,);

    javab = json.decode(response.toString());
    print(response.statusCode);
    print(response.toString());
    if (javab['ok'] == false) {
      Get.back();
      Get.defaultDialog(
          barrierDismissible: false,
          onWillPop: () async {
            return false;
          },
          title: javab['message'].toString(),
          content: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.amber,
              onPrimary: Colors.white,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              side: const BorderSide(color: Colors.black12, width: .5),
            ),

            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'برگشت', style: TextStyle(fontSize: 12, color: Colors.black
                  , fontWeight: FontWeight.bold
              ),),
            ),
            onPressed: () {
              Get.back();
            },
          )

      );
    }
    if (javab['ok'] == true) {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', javab['accessToken']);

      token = javab['accessToken'];

      Get.back();
      Get.offAll(FirstSeen());
    }
  } catch (e) {
    print(e);
  }
}

  }

 Sowhsnackbar1()async{
   Get.snackbar('برای ورورد باید ابتدا قوانین و مقررات را بپذیرید', "",
     backgroundColor: Colors.grey.withOpacity(.5),
     snackPosition: SnackPosition.BOTTOM ,);
 }

 again()async{
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
   map['accounttype_id'] = '2';
   map['mobile'] = phone.text;
   map['request_type'] = '';
   map['type'] = 'mobile';

   try {
     var response = await Dio().post('https://noyaft.com/userverification/api/send',data:map,);

     print(response.statusCode);
     log(response.toString());


   } catch (e) {
     print(e);
   }
   Get.back();}
}

