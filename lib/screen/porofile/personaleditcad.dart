import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:noyaft/contoroler/porofilecontorolers/personalcontoroler.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
class Personalcadedit extends StatelessWidget {
  final _formkey1 = GlobalKey<FormState>();
  @override
  String card = Get
      .find<PersonalContoroler>().card_number.toString();
  Widget build(BuildContext context) {
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
height: MediaQuery.of(context).size.height-150,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Text("شماره کارتی که ثبت میکنید برای بازگشت وجه پرداختی مورد استفاده قرار میگیرد (توجه کنید که شماره کارتی که ثبت میکنید به نام خودتان باشد)"
                                        ,style: TextStyle(fontSize: 15,color: Colors.grey),),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      color: Color.fromRGBO(247, 246, 241, 1),
                                      child: TextFormField(
                                        textDirection: TextDirection.ltr,

                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(19),
                                          CreditCardFormatter(),
                                        ],
                                        onChanged: (value) {
                                          // print(value);
                                          card =
                                              value;
                                        },
                                        initialValue:
                                        Get
                                            .find<PersonalContoroler>()
                                            .card_number
                                            .toString(),
                                        decoration: InputDecoration(
                                          label: Text("شماره کارت"),
                                          contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),


                                     GestureDetector(
                                onTap: () {
                                  Get.find<PersonalContoroler>().changecardnumber(card);
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






