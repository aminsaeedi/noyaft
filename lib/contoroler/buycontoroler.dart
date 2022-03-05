import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:noyaft/screen/porofile/wallet.dart';
import '../main.dart';



class BuyContoroler extends GetxController{


  late String ersalp;
  late String ersalt;
  late int orderid;

  late String tipt;
  late String tipp;
  late String piot;
  late String piop;


Future sendordr(List sefaresh)async{

  var map = <String, dynamic>{};
  map["items"]= sefaresh;
  var edit= <String, String>{};
  edit['Authorization']='Bearer $token';
  edit['Accept']="application/json";

  try {
    var response = await Dio().post('https://noyaft.com/order/api/stores',data:map,
      options: Options(
        headers: edit,
      ),
    );
    Map x = json.decode(response.toString()) ;
    log(response.statusCode.toString());
    log(response.toString());
    ersalp=x['normal_price'];
    ersalt=x['normal_time'];
    orderid=x["order_id"];
    tipt=x['tipax_time'];
    tipp=x['tipax_price'];
    piot=x['pioneer_time'];
    piop=x['pioneer_price'];


  } catch (e) {
    print(e);
  }


}

Future checkcoupn(
   String code
    )async{
  var map = <String, dynamic>{};
  map["coupon"]= code;

  var edit= <String, String>{};
  edit['Authorization']='Bearer $token';
  edit['Accept']="application/json";
  var url ='https://noyaft.com/discount/api/check';
  final response = await http.post(Uri.parse(url),headers:edit,body: map,
  );
  print(json.decode(response.statusCode.toString()));
  print(json.decode(response.body));
  String ha=json.decode(response.body)['message'];
  // flag =json.decode(response.body)['flag'];

  Get.snackbar(ha, "",
    backgroundColor: Colors.grey.withOpacity(.5),
    snackPosition: SnackPosition.BOTTOM ,);

}






  Future calculate(
  {
     required String name,
    required int sendtype,
    required int flag,
    required String coupon,
    required int paytype,
}
      ) async {
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
    map["recipient_name"]= name;
    map["id"] = orderid.toString();
    map["send_type"]=sendtype.toString();
    if(flag==1){ map["coupon"]=coupon;}
    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";
    var url ='https://noyaft.com/order/api/calculate';
    final response = await http.post(Uri.parse(url),headers:edit,body: map,
    );

    print(json.decode(response.statusCode.toString()));
    log(json.decode(response.body).toString());

   if(paytype==1){};
    if(paytype==2){await paywallet();};
    if(paytype==3){ await payathome();};


  }


  Future payathome()async{
    String majed='';
    String fa=orderid.toString();
    var map = <String, dynamic>{};
    map['pay_state'] = '2';
    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";




    var url ='https://noyaft.com/order/api/orders/$fa';

    final response = await http.put(Uri.parse(url),body: map,
      headers:edit,
    );
    print(json.decode(response.statusCode.toString()));
    log(json.decode(response.body).toString());

    majed=json.decode(response.body)['message'].toString();
    Get.back();
    Get.defaultDialog(
      barrierDismissible: true,

      title: 'پیغام',
      content: Text(majed),

    );
  }

  Future paywallet()async{

    var map = <String, String>{};
    map["id"]= orderid.toString();
    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";

    var response = await Dio().post('https://noyaft.com/order/api/pay_wallet',data:map,
      options: Options(
        headers: edit,
      ),
    );
    Map x = json.decode(response.toString()) ;
    print(response.statusCode);
    log(response.toString());
    Get.back();
    if(x['success']==0){

      Get.defaultDialog(
        barrierDismissible: true,

        title: "پیغام",
        content: Text('موجودی کیف پول شما کافی نیست'),
        actions: [
          FlatButton(onPressed: (){
            Get.back();
          }, child: Text('خروج')),
          FlatButton(onPressed: (){
          Get.to(Wallet());
          }, child: Text('شارژ کیف پول')),
        ],

      );
    }
    if(x['success']==1){

      Get.defaultDialog(
        barrierDismissible: true,

        title: "پیغام",
        content: Text('عمیلیات با موفقیت انجام شد'),
        actions: [
          FlatButton(onPressed: (){
            Get.back();
          }, child: Text('خروج')),

        ],

      );
    }
  }



}