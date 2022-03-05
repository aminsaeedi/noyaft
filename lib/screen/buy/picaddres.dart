import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noyaft/contoroler/homepagecontoroler.dart';
import 'package:noyaft/contoroler/porofilecontorolers/addrescontoroler.dart';
import 'package:noyaft/screen/buy/orderdetails.dart';
import 'package:noyaft/screen/porofile/addrese.dart';
import 'package:readmore/readmore.dart';



class picadrres extends StatefulWidget {
  const picadrres({Key? key}) : super(key: key);

  @override
  _picadrresState createState() => _picadrresState();
}

class _picadrresState extends State<picadrres> {
  List order=[];
  @override
  Widget build(BuildContext context) {


    List sefare=[];


    Get.find<HomepageContoroler>().sabad.forEach((item){
      int nn= int.parse( item['number']);
      int pp=item['product_id'];
      var x = <String, dynamic>{};
      x ["number"]= nn;
      x ["product_id"]= pp;
// String la=json.encode(x);
      sefare.add(x);


    });
    order=sefare;
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
      body:Column(
        children: [
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
                         child: Center(child: Text("1",style: TextStyle(
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
                         child: Center(child: Text("2",style: TextStyle(
                             color: Colors.grey[800]
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
               Text("انخاب آدرس",style: TextStyle(
                   color: Colors.grey[800],
                   fontSize: 14
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
          SizedBox(
            height: MediaQuery.of(context).size.height-240,

            child:ListView(children: [
              SizedBox(height: 20,),


              Container(
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width-20,
                  child:
                  (Get.find<HomepageContoroler>().has) ?    Center(
                    child: CircularProgressIndicator(),
                  )
                      :     ListView.builder(

                      itemCount: Get.find<HomepageContoroler>().sabad.length,
                      itemBuilder: (BuildContext context , index) {

                        int num=int.parse( Get.find<HomepageContoroler>().sabad[index]['number']);

                        var x = Get.find<HomepageContoroler>().sabad[index]['product_img'];
                        int pid= Get.find<HomepageContoroler>().sabad[index]['product_id'];
                        int shid = Get.find<HomepageContoroler>().sabad[index]['id'];




                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(width: MediaQuery.of(context).size.width,
                            height: 200,
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
                            child: Column(children: [
                              Row(children: [
                                CachedNetworkImage(
                                  imageUrl: (Get.find<HomepageContoroler>().sabad[index]['product_img']== null )
                                      ?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwHzCdDvPfd-O9S5oDUItLjGB1Gy-Ra36U2Q&usqp=CAU'
                                      :'https://noyaft.com/$x',
                                  height: 150,
                                  width: MediaQuery.of(context).size.width/3,
                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                      Container(color: Colors.white,),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                                Column(
                                  children: [
                                    Container(

                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text(Get.find<HomepageContoroler>().sabad[index]['product']['full_product'],style:TextStyle( color:  Colors.black,))),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(

                                          width: MediaQuery.of(context).size.width/3,
                                          child: Text(Get.find<HomepageContoroler>().sabad[index]['product']['price'],style:TextStyle( color:  Colors.black,))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(

                                          width: MediaQuery.of(context).size.width/3,
                                          child: Text(Get.find<HomepageContoroler>().sabad[index]['product_inventory']+" موجود",style:TextStyle( color:  Colors.grey,fontSize: 12))),
                                    ),

                                  ],
                                ),
                              ],),
                              Row(

                                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: GestureDetector(
                                        onTap:()async{
                                          setState(() {
                                            Get.find<HomepageContoroler>().has=true;
                                          });
                                          print(shid);
                                          await Get.find<HomepageContoroler>().deleteshshop(pid, shid);
                                          setState(() {
                                            Get.find<HomepageContoroler>().has=false;
                                          });
                                        },
                                        child: Text("X",style: TextStyle(fontSize: 25,color: Colors.red,fontWeight: FontWeight.bold),)),
                                  ),

                                  Row(
                                    children: [
                                      IconButton(onPressed: ()async{
                                        setState(() {
                                          Get.find<HomepageContoroler>().has=true;
                                        });

                                        await Get.find<HomepageContoroler>().sendshop( 1, pid);
                                        setState(() {
                                          Get.find<HomepageContoroler>().has=false;
                                        });

                                      },
                                          icon: Icon(Icons.add,color: Colors.green,size: 35,)),

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("$num",
                                            style:TextStyle( color:  Colors.grey[800],
                                                fontSize: 20)),
                                      ),

                                      IconButton(onPressed: ()async{

                                        setState(() {
                                          Get.find<HomepageContoroler>().has=true;
                                        });
// print(num-1);
                                        await Get.find<HomepageContoroler>().sendshop( - 1, pid);
                                        setState(() {
                                          Get.find<HomepageContoroler>().has=false;
                                        });
                                      },
                                          icon: Icon(Icons.remove,color: Colors.green,size: 35)),

                                    ],
                                  ),

                                ],)
                            ],),
                          ),
                        );

                      }



                  )
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width:MediaQuery.of(context).size.width ,
                  // height: 80,
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
                        spreadRadius: 1.5,
                        blurRadius: 2,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text("خلاصه سبد خرید",style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),),
                          ), SizedBox(width: 20,),
                        ],
                      ),


                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Text("هزینه کالا های انتخاب شده",style: TextStyle(color: Colors.grey[800],

                                  fontSize: 18
                              ),),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Text(Get.find<HomepageContoroler>().gheymat,style: TextStyle(color: Colors.grey[800],

                                  fontSize: 14
                              ),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Text("تعداد کالا های انتخاب شده: "+Get.find<HomepageContoroler>().tedad.toString(),style: TextStyle(color: Colors.grey[800],

                                  fontSize: 14
                              ),),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Text("تخفیف اعمال شده 0 ریال",style: TextStyle(color: Colors.red[800],

                                  fontSize: 18
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ],),
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
                        padding: const EdgeInsets.only(top:10.0,left: 20,right: 23,bottom: 10),
                        child: Container(
                          child:
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ارسال به', style: TextStyle( fontSize: 20,color: Colors.grey[700]),),


                                  GestureDetector(
                                      onTap: (){   Get.to(Address());},
                                      child: Text('انتخاب آدرس', style: TextStyle( fontSize: 20,color: Colors.blue[700]),)),
                                ],),
                              SizedBox(height: 15,),
                              ReadMoreText(
                                Get.find<AdreessContoroler>().deafuiltid['full_province'].toString()+' '+
                                    Get.find<AdreessContoroler>().deafuiltid['full_city'].toString()+' '+
                                    Get.find<AdreessContoroler>().deafuiltid['full_town'].toString()+' '+
                                    Get.find<AdreessContoroler>().deafuiltid['avenue']+' '+
                                    Get.find<AdreessContoroler>().deafuiltid['alley']+' '+'پلاک'
                                    +   Get.find<AdreessContoroler>().deafuiltid['plaque'].toString()
                                ,
                                style: TextStyle( fontSize: 15,color: Colors.grey[700]),
                                trimLines: 2,
                                colorClickableText: Colors.grey,
                                trimMode: TrimMode.Line,
                                trimExpandedText: ' ',
                                trimCollapsedText: ' ',),
                            ],
                          ),
                        ),
                      ),

                    ],),
                ),
              ),
            ],),
          ),
        ],

      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    SizedBox(
      width:10 ,
    ),
                 GestureDetector(
                   onTap: (){
Get.to(OrderDetails(orderlist: order,));
                     log(order.toString());
                   },

                     child: Text('مرحله ی بعد ',style: TextStyle(color: Color.fromRGBO(8, 209, 45, 1),fontSize: 19,fontWeight: FontWeight.bold),))
              ],),
          ),
        ),
      ),
    );
  }
}
