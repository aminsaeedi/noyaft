import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:noyaft/contoroler/porofilecontorolers/addrescontoroler.dart';
import 'package:noyaft/contoroler/porofilecontorolers/personalcontoroler.dart';
import '../main.dart';


class HomepageContoroler extends GetxController {
  List category = [];
  List products = [];
  List invention = [];
  List neww = [];
  List visit = [];
  List buy = [];
  List slider = [];


  String gheymat = "0";
  int tedad = 0;

  bool has = false;

  late List sefaresh;

  List sabad = [];

  Future gethomeapi() async {
    // print('ffffffff');
    try {
      var response = await Dio().get(
        'https://noyaft.com/product/api/home',);
      Map<String, dynamic> res;
      res = json.decode(response.toString());
      // print(response.statusCode);
      // print(res);

      // invention= res['invention'];

      neww = res['new'];
      visit = res['visit'];
      buy = res['buy'];
    } catch (e) {
      print(e);
    }

    await setslider();
    await setcategori();
    // await Setsabad();
    // await Get.find<AdreessContoroler>().getadress();
    // await  Get.find<PersonalContoroler>().getuserdata();
  }


  Future setslider() async {
    try {
      var response = await Dio().get(
        'http://noyaft.com/site/api/site_sliders',);
      Map<String, dynamic> res;
      res = json.decode(response.toString());
      // print(response.statusCode);
      // print(res);
      if (response.statusCode == 200) {
        res = json.decode(response.toString());

        res['data']['items'].forEach((item) {
          slider.add(item['img']);
        });
      }
    } catch (e) {
      print(e);
    }
  }


  Future setcategori() async {
    try {
      var response = await Dio().get(
        'http://noyaft.com/product/api/categories',);
      Map<String, dynamic> res;
      res = json.decode(response.toString());
      // print(response.statusCode);
      // print(res);
      category = res["data"]["items"];
      // print("*******");
// print(category);
    } catch (e) {
      print(e);
    }
    await setproduct();
  }


  Future setproduct() async {
    try {
      var response = await Dio().get(
        'http://noyaft.com/product/api/products',);
      Map<String, dynamic> res;
      res = json.decode(response.toString());
      // print(response.statusCode);
      // print(res);
      if (response.statusCode == 200) {
        var sorteed = res['data'];
        var mamaad = sorteed['items'];
        products = mamaad;
      }
    } catch (e) {
      print(e);
    }
  }

  Future Setsabad() async {
    var edit = <String, String>{};
    edit['Authorization'] = 'Bearer $token';
    edit['Accept'] = "application/json";
    var url = 'https://noyaft.com/order/api/shopping_cart_tmp';
    final response = await http.get(Uri.parse(url), headers: edit,);

      log(json.decode(response.body).toString());
print("1111111");
    var f = json.decode(response.body) as List;
   print("222222222");
    sabad = f;
  }


  Future sendshop(int numb,
      int proid) async {
    var map = <String, dynamic>{};
    map['number'] = numb.toString();
    map['product_id'] = proid.toString();
    var edit = <String, String>{};
    edit['Authorization'] = 'Bearer $token';
    edit['Accept'] = "application/json";
    var url = 'https://noyaft.com/order/api/shopping_cart_tmp';
    final response = await http.post(Uri.parse(url), headers: edit, body: map,
    );
    // print(json.decode(response.statusCode.toString()));
    // print (json.decode(response.body.toString()));

   await Setsabad();
  }


  Future deleteshshop(int proid,
      int shidd

      ) async {
    var edit = <String, String>{};
    edit['Authorization'] = 'Bearer $token';
    edit['Accept'] = "application/json";
    var url = 'https://noyaft.com/order/api/shopping_cart_tmp/$shidd';
    final response = await http.delete(Uri.parse(url), headers: edit,
    );


    await Setsabad();
  }
}

