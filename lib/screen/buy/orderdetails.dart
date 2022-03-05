import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:noyaft/contoroler/buycontoroler.dart';
import 'package:noyaft/screen/buy/finalbuy.dart';



class OrderDetails extends StatefulWidget {
List orderlist;
OrderDetails({
  required this.orderlist,
});

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  BuyContoroler _bc = Get.put(BuyContoroler());


  String name='';
  String tozih='';
  int sendtype=1;

  @override
  bool loding =true;
  void initState() {
    super.initState();

    order();

  }
  bool normal=true;
  bool pionner=false;
  bool tipax = false;


  Widget build(BuildContext context) {
    if(loding){
      return Scaffold(
        appBar:AppBar(
          title: Text(
            'انتخاب آدرس',
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
        body: Column(
          children: [

            SizedBox(
              height: MediaQuery.of(context).size.height/3,
            ),
            Center(
              child:  LoadingAnimationWidget.staggeredDotsWave(

                size: 50, color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar:AppBar(
        title: Text(
          'قرایند پرداخت',
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
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration:  BoxDecoration(
                            color:Color.fromRGBO(8, 209, 45, 1),
                            shape: BoxShape.circle),
                        child: Center(child:  Icon(Icons.check,color: Colors.white,)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        height: 5,
                        color: Color.fromRGBO(8, 209, 45, 1),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(8, 209, 45, 1),
                            shape: BoxShape.circle),
                        child: Center(child: Text("2",style: TextStyle(
                            color: Colors.white
                            ,fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        height: 5,
                        color: Colors.grey,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle),
                        child: Center(child: Text("3",style: TextStyle(
                            color: Colors.grey[800]
                            ,fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),)),
                      ),
                    ],
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text("انتخاب آدرس",style: TextStyle(
                      color: Color.fromRGBO(8, 209, 45, 1),
                      fontSize: 14
                  ),),
                  SizedBox(width: MediaQuery.of(context).size.width/3-60,),
                  Text("جزییات سفارش",style: TextStyle(
                      color: Color.fromRGBO(8, 209, 45, 1),
                      fontSize: 13
                  ),),
                  SizedBox(width: MediaQuery.of(context).size.width/3-60,),
                  Text("انخاب آدرس",style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 14
                  ),),

                ],
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: [
                        Text('نحوه ارسال'
                          ,style: TextStyle(color: Colors.black
                              ,fontSize: 25,
                              fontWeight: FontWeight.bold),),

                      ],),
                  ),
                  (_bc.ersalt=='')
                      ?Container()
                      :
                  Row(
                    children: [
                      Checkbox(
                        activeColor:Color.fromRGBO(8, 209, 45, 1) ,
                        checkColor: Colors.white,
                        value: normal,
                        onChanged: (value) {
                          setState(() {

                            if(value==true){
                              sendtype=1;
                              normal = value!;
                              pionner=false;
                              tipax=false;
                            }
                            if(value==false){
                            }
                          });

                        },
                      ),
                      Container(
                          child:Row (children: [
                            Text('ارسال با پیک',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('_',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('در'+_bc.ersalt+"روز",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('_',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('قیمت:'+_bc.ersalp,style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                          ],)

                      ),
                    ],
                  ),
                  (_bc.tipt=='')
                      ?Container()
                      :  Row(
                        children: [
                          Checkbox(
                            activeColor:Color.fromRGBO(8, 209, 45, 1) ,
                            checkColor: Colors.white,
                            value: pionner,
                            onChanged: (value) {
                              setState(() {

                                if(value==true){
                                  sendtype=2;
                                  pionner = value!;
                                  normal=false;
                                  tipax=false;
                                }
                                if(value==false){
                                }
                              });

                            },
                          ),
                          Container(
                          child:Row (children: [
                            Text('ارسال با پیک',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('_',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('در'+_bc.tipt+"روز",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('_',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('قیمت:'+_bc.tipp,style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                          ],)

                  ),
                        ],
                      ),
                  (_bc.piot=='')
                      ?Container()
                      :  Row(
                        children: [
                          Checkbox(
                            activeColor:Color.fromRGBO(8, 209, 45, 1) ,
                            checkColor: Colors.white,
                            value: tipax,
                            onChanged: (value) {
                              setState(() {

                                if(value==true){
                                  sendtype=3;
                                  tipax = value!;
                                  normal=false;
                                  pionner=false;
                                }
                                if(value==false){

                                }
                              });

                            },
                          ),
                          Container(
                          child:Row (children: [
                            Text('ارسال با پیک',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('_',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('در'+_bc.piot+"روز",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('_',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('قیمت:'+_bc.piop,style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                          ],)

                  ),
                        ],
                      ),

                  SizedBox(height: 25,)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: [
                        Text('تحویل محصول'
                          ,style: TextStyle(color: Colors.black
                              ,fontSize: 22,
                              fontWeight: FontWeight.bold),),

                      ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      width: MediaQuery.of(context).size.width-90,
                      alignment: Alignment.topCenter,
                      color: Color.fromRGBO(247, 246, 241, 1),
                      child: TextFormField(
                        onChanged: (value){
                          name=value;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('نام تحویل گیرنده')


                        ),


                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      width: MediaQuery.of(context).size.width-90,
                      alignment: Alignment.topCenter,
                      color: Color.fromRGBO(247, 246, 241, 1),
                      child: TextFormField(
                        onChanged: (value){
                          tozih=value;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('توضیحات')


                        ),


                      ),

                    ),
                  ),
                  SizedBox(height: 25,)
                ],
              ),
            ),
          ),
        ],),
      ),


      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (){Get.back();
                    },

                    child: Text(' مرحله ی قبل',style: TextStyle(color: Color.fromRGBO(8, 209, 45, 1),fontSize: 19,fontWeight: FontWeight.bold),)),
                GestureDetector(
                    onTap: (){
        if(name==''){
          Get.snackbar('لطفا نام تحویل گیرنده را وارد کنید', "",
            backgroundColor: Colors.grey.withOpacity(.5),
            snackPosition: SnackPosition.BOTTOM ,);
        }else{
          Get.to(FinalBuy(tozih: tozih, name: name, sentype: sendtype,));
        }
                    },

                    child: Text('مرحله ی بعد ',style: TextStyle(color: Color.fromRGBO(8, 209, 45, 1),fontSize: 19,fontWeight: FontWeight.bold),))
              ],),
          ),
        ),
      ),

    );
  }
  order()async{
    await Get.find<BuyContoroler>().sendordr(widget.orderlist);
    setState(() {
      loding = false;
    });
  }
}
