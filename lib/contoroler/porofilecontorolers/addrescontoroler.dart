import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:noyaft/screen/porofile/addrese.dart';
import '../../main.dart';

class AdreessContoroler extends GetxController{

  List address =[];
  Map deafuiltid={};
  int deafhas=0;


  int deleteid=-5;
  int id =-5;

  Future getadress() async{
    print("1111111");
    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";

    try {
      var response = await Dio().get('https://noyaft.com/customer/api/addresses',
        options: Options(
          headers: edit,
        ),
      );

      print(response.statusCode);
      print(response);
      address=json.decode(response.toString())['data']['items'];
if(address.length!=0){
address.forEach((item) {
  if (item["default_address"] == 1) {
    deafuiltid = item;
  }
deafhas=1;
});}

    } catch (e) {
      print(e);
    }
  }

  Future deleteadrees() async{
    if(deleteid!=-5){
      var x =deleteid.toString();
      var edit= <String, String>{};
      edit['Authorization']='Bearer $token';
      edit['Accept']="application/json";

      try {
        var response = await Dio().delete('https://noyaft.com/customer/api/addresses/$x',
          options: Options(
            headers: edit,
          ),
        );

        print(response.statusCode);
        print(response);


      } catch (e) {
        print(e);
      }


    }
  }

  Future chosedeafult() async{
    if(id!=-5){
      var x =id.toString();
      var map = <String, dynamic>{};
      map['default_address'] = '1';
      var edit= <String, String>{};
      edit['Authorization']='Bearer $token';
      edit['Accept']="application/json";

      try {
        var response = await Dio().put('https://noyaft.com/customer/api/addresses/$x',
            options: Options(
              headers: edit,
            ),data:map
        );

        print(response.statusCode);
        print(response);


      } catch (e) {
        print(e);
      }

    }
  }




}


class NewAddressContoroler extends GetxController{
  late String kod_posti;
  late String khiaban;
  late String kooche;
  late String pelak;
  double lat=0;
  double lng=0;


  List countrys=[];
  List provinces=[];
  List citys=[];
  List towns=[];

  String name_contry='کشور';
  String name_proo='استان';
  String name_city='شهرستان';
  String name_town="شهر";
  int cant=0;
  int poor=0;
  int cii=0;
  int to=0;


  Future sendaddres() async{
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
    map['address'] = '$kod_posti $pelak $kooche $khiaban-$name_town $name_city $name_proo $name_contry';
    map['city_id'] = "$cii";
    map['plaque'] = pelak;
    map['default_address'] = '1';
    map['zip_code'] = kod_posti;
    map['avenue'] = khiaban;
    map['alley'] = kooche;
    map['province_id'] = '$poor';
    map['country_id'] = '$cant';
    map['town_id'] = "$to";
    map['lat'] = lat.toString();
    map['lng'] = lng.toString();
    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";
    var url ='https://noyaft.com/customer/api/addresses';

    final response = await http.post(Uri.parse(url),body: map,
      headers:edit,
    );
    print(json.decode(response.statusCode.toString()));
    print (json.decode(response.body));
    Get.back();
    Get.defaultDialog(
        barrierDismissible: false,
        onWillPop: ()async{
          return false;
        },
      title: 'لطفا صبر کنید',
      content: const Center(
        child: Text(
      'آدرس ثبت شد'

        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
            onPrimary: Colors.white,
            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
            side: const BorderSide(color: Colors.black12, width: .5),
          ),

          child:Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('متوجه شدم',style: TextStyle(fontSize: 12,color: Colors.black
                ,fontWeight: FontWeight.bold
            ),),
          ) ,
          onPressed: ()async{

            Get.off(Address());
          },
        ),
      ]

    );
  }

  Future<String> getall()async{

    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";

    var responsec = await Dio().get('https://noyaft.com/base/api/countries',options: Options(
      headers: edit,
    ),

    );

    countrys.addAll(json.decode(responsec.toString())['data']['items']);
    // print(responsec.statusCode);
    // print(responsec);

    await getprov();
    await getcity();
    await  gettow();

    return 'ali';


  }

  Future getprov() async{
    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";
    var responsec = await Dio().get('https://noyaft.com/base/api/provinces',options: Options(
      headers: edit,
    ),

    );
    provinces.addAll(json.decode(responsec.toString())['data']['items']);
    // print(responsec.statusCode);
    // print(responsec);

  }

  Future getcity() async{
    var edit= <String, String>{};
    edit['Authorization']='Bearer $token';
    edit['Accept']="application/json";
    var responsec = await Dio().get('https://noyaft.com/base/api/cities',options: Options(
      headers: edit,
    ),

    );
    citys.addAll(json.decode(responsec.toString())['data']['items']);
    // print(responsec.statusCode);
    // print(responsec);



  }

  Future gettow() async{var edit= <String, String>{};
  edit['Authorization']='Bearer $token';
  edit['Accept']="application/json";

  var responsec = await Dio().get('https://noyaft.com/base/api/towns',options: Options(
    headers: edit,
  ),

  );
  towns.addAll(json.decode(responsec.toString())['data']['items']);
  // print(responsec.statusCode);
  // print(responsec);

  }



}