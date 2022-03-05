
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class SearchViewContoroler extends GetxController{
List pro=[];
String search="";
RxInt setemie=0.obs;
bool setsa=false;



  ali({required Function setstate}){
  setstate();
  print("ewdxcrtfygbhnuijm");
}

setvalue(){
  setemie=setemie+1;
  update();
}



  Future  sendsearch() async {
// print(search);
    String url = 'http://noyaft.com/product/api/products2?filter[name]=$search';
    final response = await http.get(Uri.parse(url),headers: {},);
    print('sss');
    print(json.decode(response.statusCode.toString()));
    print(json.decode(response.body));

    pro=json.decode(response.body)['data']['items'];
    print("eeeeennnndddd");
// ali(setstate: se);
// setsa==true;
  }

// @override
//   void onInit() {
//
//     // TODO: implement onInit
//     debounce(setemie, (_){
//        sendsearch();
//
//
//     },
//     time: Duration(seconds: 2)
//     );
//    }


}