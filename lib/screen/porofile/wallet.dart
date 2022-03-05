
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:noyaft/contoroler/porofilecontorolers/walletcontoroler.dart';



class Wallet extends StatelessWidget {

  WalletContoroler _wc = Get.put(WalletContoroler());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          "نظرات کاربران",
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
        backgroundColor:Color.fromRGBO(8, 209, 45, 1),) ,


      body:  FutureBuilder(
        builder: (ctx, snapshot) {

          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            if (snapshot.hasError) {
              return Container();


            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child:

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height-120,
                      width:  MediaQuery.of(context).size.width,
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
                            blurRadius: 2,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(children: [
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                SizedBox(width: 15,),
                                Text("موجودی کیف پول شما "+_wc.mony+" ریال",style: TextStyle(
                                    color: Colors.green[800]
                                    ,fontSize: 17
                                ),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width-90,
                                alignment: Alignment.topCenter,
                                color: Color.fromRGBO(247, 246, 241, 1),

                                child: TextFormField(
                                  onChanged: (value){

                                  },

                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text('مبلغ شارژ')


                                  ),



                                ),

                              ),
                            ),
                            Row(
                              children: [SizedBox(width: 15,),
                                Text("مبلغ شارژ را به ریال وارد کنید",style: TextStyle(
                                    color: Colors.grey[800]
                                    ,fontSize: 14
                                ),),
                              ],
                            ),
                          ],),


                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {},
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

                                  child:      Text('پرداخت',
                                    style:
                                    TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


              );




            }
          }

          // Displaying LoadingSpinner to indicate waiting state
          return Center(
            child:   Center(
              child:  LoadingAnimationWidget.staggeredDotsWave(

                size: 50, color: Colors.grey,
              ),
            ),
          );
        },

        future: _wc.getpoldata(),
      ),
    );
  }
}
