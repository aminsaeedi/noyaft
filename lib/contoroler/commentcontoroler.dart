import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../main.dart';


class CommentCotoroler extends GetxController{

  List comment=[];
  int nomre=4;
  String com='';








    Future<String> getcomment(
        int id
        ) async {

      String url = 'https://noyaft.com/product/api/comments?filter[product_id]=$id&filter[state]=1';
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> javab;

      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        javab = json.decode(response.body);
      comment=javab['data']["items"];
      }

      return'hi';
    }

Sendcomment(
    int pid
    ){

  Get.defaultDialog(
    barrierDismissible: true,

    title: 'امتیاز شما به این محصول',
    content: Container(

  child: Column(
  children: [
  RatingBar(
  initialRating: 4,
  minRating: 1,
  direction: Axis.horizontal,
  allowHalfRating: false,
  itemCount: 5,
  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),

  onRatingUpdate: (rating) {
  nomre=rating.toInt();
  },
  ratingWidget:  RatingWidget(
  full: Icon(Icons.star,color: Colors.amber),
  half: Icon(Icons.star_half,color: Colors.amber),
  empty: Icon(Icons.star_outline,color: Colors.amber),
  ),
  ),
  Container(
  child:    TextFormField(
  minLines: 3,
  maxLines: 7,
  maxLength: 250,
  onChanged: (value){
  com=value;
  },
  decoration: InputDecoration(
  labelText: 'نظر خود را وارد کنید ',
  prefixIcon: Icon(Icons.comment),

  ),


  ),
  ),
  ],
  ),),
    actions: [
      FlatButton(onPressed: (){
    send_comment(pid);
    Get.back();

  }, child: Text('نظر خود را ارسال کند')),

  ],
  );
  }





  Future send_comment(
      int id
      ) async {
    var map = <String, dynamic>{};
    map['comment'] = com;
    map['product_id'] = '$id';
    map['star'] = '$nomre';
    var comment = <String, String>{};
    comment['Authorization'] = 'Bearer $token';
    comment['Accept'] = "application/json";
    var url = 'https://noyaft.com/product/api/comments';

    final response = await http.post(Uri.parse(url),
      body: map,
      headers: comment,
    );
    print(json.decode(response.statusCode.toString()));
    print(json.decode(response.body));
    if (json.decode(response.body)['success'] == true) {
      Get.defaultDialog(
        barrierDismissible: true,
        title: 'کامنت ثبت شد',
        content: Text(" "),
        actions: [
          FlatButton(onPressed: () {
            Get.back();
          }, child: Text('خروج')),

        ],
      );
    }
  }
}
