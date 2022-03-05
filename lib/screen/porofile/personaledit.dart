

import 'dart:developer';

import 'package:persian_datetimepickers/persian_datetimepickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noyaft/contoroler/porofilecontorolers/personalcontoroler.dart';
import 'package:persian_number_utility/src/extensions.dart';

class Personal_edit extends StatelessWidget {
  final _formkey1 = GlobalKey<FormState>();
  @override
  String codemeli = Get
      .find<PersonalContoroler>().national_code.toString();
  String esm = Get
      .find<PersonalContoroler>()
      .name
      .toString();
  String famil = Get
      .find<PersonalContoroler>()
      .familyname
      .toString();
  String storen = Get
      .find<PersonalContoroler>()
      .store_name
      .toString();
  String tavalod = Get
      .find<PersonalContoroler>()
      .birth_date
      .toString();


  Widget build(BuildContext context) {


    log(Get.find<PersonalContoroler>().ta.toString());
    print(Get.find<PersonalContoroler>().store_name.toString());

    return Scaffold(
      appBar:AppBar(
        title: Text(
          'ویرایش اطلاعات کابر',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[

        ],
        leading:         IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 22,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,

        elevation: 0.00,
        backgroundColor:Color.fromRGBO(8, 209, 45, 1),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                key: _formkey1,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(

                          width: MediaQuery
                              .of(context).size.width - 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  color: Color.fromRGBO(247, 246, 241, 1),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      storen =
                                          value;
                                    },
                                    initialValue:
                                    Get
                                        .find<PersonalContoroler>()
                                        .store_name
                                        .toString(),
                                    decoration: InputDecoration(
                                      label: Text("نام فروشگاه"),
                                      contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                    ),
                                  ),
                                ),
                              ),



                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  // height: 100,
                                   color: Color.fromRGBO(247, 246, 241, 1),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      esm = value;
                                    },
                                    initialValue:
                                    '${ Get
                                        .find<PersonalContoroler>()
                                        .name}',
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                        label: Text("اسم")),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  color: Color.fromRGBO(247, 246, 241, 1),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      famil =
                                          value;
                                    },
                                    initialValue:
                                    '${ Get
                                        .find<PersonalContoroler>()
                                        .familyname}',
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                      label: Text("فامیل"),
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  color: Color.fromRGBO(247, 246, 241, 1),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      codemeli =
                                          value;
                                    },



                                    initialValue:
                                    Get
                                        .find<PersonalContoroler>()
                                        .national_code
                                        .toString(),
                                    decoration: InputDecoration(
                                      label: Text("کد ملی"),
                                      contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                    ),
                                  ),

                                ),
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey,
                                      onPrimary: Colors.white,
                                      shape: const BeveledRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(1))),
                                      side:  BorderSide(color: Colors.blueGrey[200]!, width: .9),
                                    ),
                                    onPressed: ()   async{
                                      final DateTime? date = await showPersianDatePicker(
                                        context: context,
                                        color: Color.fromRGBO(8, 209, 45, 1)
                                      );
                                      String tow= date.toString();
                                      String tow2=tow.split(' ')[0];
                                      Get.find<PersonalContoroler>().ta=tow2.obs;
                                      tavalod= tow2;
                                      Get.find<PersonalContoroler>().pla();
                                    },
                                    child: Text('تغییر تاریخ تولد',style: TextStyle(color: Colors.black)),
                                  ),
                                  Obx(()=>
                                      Column(
                                        children: [

                                          Text(Get.find<PersonalContoroler>().ta.toString().toPersinaDate()
                                            ,style: TextStyle(fontSize: 15),),

                                          Text(Get.find<PersonalContoroler>().mame.toString(),style:
                                          TextStyle(fontSize: 0)
                                          ),
                                        ],
                                      ),

                                  ),
                                ],
                              ),


                              SizedBox(height: MediaQuery.of(context).size.height/4,)

                     ,        GestureDetector(
                                onTap: () {
                                  Get.find<PersonalContoroler>().changepersonaldata(
                                      esm, famil, storen, tavalod,codemeli);
                                  Get.find<PersonalContoroler>().pla();

                                },
                       child: Container(height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(8, 209, 45, 1),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)
                                    ),

                                  ),
                                  child: Center(

                                    child:      Text('تایید اطلاعات',
                                      style:
                                      TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),

                                  ),
                                ),
                     ),

                            ],
                          ),
                        ),
                      ),



                    ],
                  ),
                )),









          ],
        ),
      ),
    );
  }


}




