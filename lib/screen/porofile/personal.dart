
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:noyaft/contoroler/porofilecontorolers/personalcontoroler.dart';
import 'package:noyaft/screen/porofile/personaledit.dart';
import 'package:noyaft/screen/porofile/personaleditcad.dart';
import 'package:persian_number_utility/src/extensions.dart';

class Personal extends StatelessWidget {


  @override
  PersonalContoroler _pec = Get.put(PersonalContoroler());
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text(
            'ویرایش اطلاعات',
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

      body: FutureBuilder(
        builder: (ctx, snapshot) {

          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            if (snapshot.hasError) {
              return Container();


            } else if (snapshot.hasData) {
              return

                SingleChildScrollView(
                  child: Column(children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Obx(()=>
                          Column(
                            children: [
                              Text(_pec.mobile.toString()
                                ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text(Get.find<PersonalContoroler>().mame.toString(),style:
                              TextStyle(fontSize: 0)
                              ),    ],
                          ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
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

                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            SizedBox(height: 12,),
                            Padding(
                              padding: const EdgeInsets.only(left: 18,right: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text('اطلاعات کاربر',style: TextStyle(color: Colors.grey[600],fontSize: 16),),

                                  GestureDetector(
                                    onTap: (){
                               Get.to(Personal_edit());
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.edit,color: Colors.blue[800],),
                                        Text('ویرایش اطلاعات',style: TextStyle(color: Colors.blue[800],fontSize: 15),),
                                      ],
                                    ),
                                  ),

                                ],),
                            ),

                            SizedBox(height: 12,),
                            Container(height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey[500],
                            ),  SizedBox(height: 10,),
                          Row(
                            children: [
                                  Text('نام فروشگاه',style: TextStyle(color: Colors.grey[600],fontSize: 16),),

                            ],
                          ),
                            Row(
                              children: [
                                Obx(()=>
                                    Column(
                                      children: [
                                        Text(_pec.store_name.toString()
                                          ,style: TextStyle(fontSize: 19),),
                                        Text(Get.find<PersonalContoroler>().mame.toString(),style:
                                        TextStyle(fontSize: 0)
                                        ),    ],
                                    ),
                                ),
                              ],
                            ), SizedBox(height: 10,),
                            Row(
                              children: [

                                    Text('نام و نام خانوادگی',style: TextStyle(color: Colors.grey[600],fontSize: 16),),



                              ],
                            ),
                            Row(
                              children: [

                                Obx(()=>
                                    Column(
                                      children: [
                                        Text(_pec.name.toString()+ " "+_pec.familyname.toString()
                                          ,style: TextStyle(fontSize: 19),),
                                        Text(Get.find<PersonalContoroler>().mame.toString(),style:
                                        TextStyle(fontSize: 0)
                                        ),    ],
                                    ),
                                ),


                              ],
                            ), SizedBox(height: 10,),
                            Row(
                              children: [

                                Text('تاریخ تولد',style: TextStyle(color: Colors.grey[600],fontSize: 16),),



                              ],
                            ),
                            Row(
                              children: [

                                Obx(()=>
                                    Column(
                                      children: [
                                        Text(_pec.birth_date.toString().toPersinaDate(),style: TextStyle(fontSize: 19),


                                        ), Text(Get.find<PersonalContoroler>().mame.toString(),style:
                                        TextStyle(fontSize: 0)
                                        ),
                                      ],
                                    ),



                                ),


                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [

                                Text('کدملی',style: TextStyle(color: Colors.grey[600],fontSize: 16),),



                              ],
                            ),
                            Row(
                              children: [

                                Obx(()=>
                                    Column(
                                      children: [
                                        Text(_pec.national_code.toString()
                                          ,style: TextStyle(fontSize: 19),),
                                        Text(Get.find<PersonalContoroler>().mame.toString(),style:
                                        TextStyle(fontSize: 0)
                                        ),    ],
                                    ),
                                ),


                              ],
                            ),
                            SizedBox(height: 10,),

                          ],),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(10.0),
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

                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            SizedBox(height: 12,),
                            Padding(
                              padding: const EdgeInsets.only(left: 18,right: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text('اطلاعات حساب بانکی',style: TextStyle(color: Colors.grey[600],fontSize: 16),),

                                  GestureDetector(
                                    onTap: (){
                                      Get.to(Personalcadedit());
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.edit,color: Colors.blue[800],),
                                        Text('ویرایش اطلاعات حساب',style: TextStyle(color: Colors.blue[800],fontSize: 15),),
                                      ],
                                    ),
                                  ),

                                ],),
                            ),

                            SizedBox(height: 12,),
                            Container(height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey[500],
                            ),  SizedBox(height: 10,),
                            Row(
                              children: [
                                Text('شماره کارت',style: TextStyle(color: Colors.grey[600],fontSize: 16),),

                              ],
                            ),
                            Row(
                              children: [
                                Obx(()=>
                                    Column(
                                      children: [
                                        Text(_pec.card_number.toString()
                                          ,style: TextStyle(fontSize: 19),
                                          textDirection: TextDirection.ltr,
                                        ),
                                        Text(Get.find<PersonalContoroler>().mame.toString(),style:
                                        TextStyle(fontSize: 0)
                                        ),    ],
                                    ),
                                ),
                              ],
                            ),  SizedBox(height: 10,),
                          ],),
                        ),
                      ),
                    ),
                  ],),
                );
            }
          }

          // Displaying LoadingSpinner to indicate waiting state
          return  Center(
            child:  LoadingAnimationWidget.staggeredDotsWave(

              size: 50, color: Colors.grey,
            ),
          );
        },

        future: _pec.getuserdata(),
      ),
    );
  }
}
